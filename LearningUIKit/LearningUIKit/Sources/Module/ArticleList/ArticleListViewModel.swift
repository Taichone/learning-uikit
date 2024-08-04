//
//  ArticleListViewModel.swift
//  LearningUIKit
//
//  Created by Taichi on 2024/07/22.
//

import Foundation
import Combine

protocol ArticleListViewModelInterface {
    var input: ArticleListViewModel.Input { get }
    var output: ArticleListViewModel.Output { get }
}

final class ArticleListViewModel: BaseViewModel<ArticleListViewModel>, ArticleListViewModelInterface {
    struct Input: InputType {
        let viewDidAppear: PassthroughSubject<Void, Never> = .init()
        // let tappedGearButton: PassthroughSubject<Void, Never> = .init()
         let tappedArticle: PassthroughSubject<ArticleID, Never> = .init()
    }

    struct Output: OutputType {
        let articles: AnyPublisher<[(ArticleListSectionModel, [ArticleListItemModel])], Never>
        let loading: AnyPublisher<Bool, Never>
    }

    struct State: StateType {
        let articles: CurrentValueSubject<[Article], Never> = .init([])
    }

    struct Dependency: DependencyType {
        let router: ArticleListRouterInterface
        let articleStoreUseCase: ArticleStoreUseCaseInterface
    }

    static func bind(input: Input, state: State, dependency: Dependency, cancellables: inout Set<AnyCancellable>) -> Output {
        let loadingSubject = PassthroughSubject<Bool, Never>()

        input.viewDidAppear
            .receive(on: DispatchQueue.global(qos: .default))
            .sinkByAsync(receiveValue: { _ in
                do {
                    loadingSubject.send(true)
                    let articles = try await dependency.articleStoreUseCase.fetchArticles()
                    loadingSubject.send(false)
                    state.articles.send(articles)
                } catch {
                    NSLog(error.localizedDescription)
                }
            })
            .store(in: &cancellables)

        // TODO: 必要に応じてソートやグルーピングなども行う
        let articles = state.articles
            .receive(on: DispatchQueue.global(qos: .background))
            .map { articles -> [(ArticleListSectionModel, [ArticleListItemModel])] in
                let articleListItems = articles.map { article -> ArticleListItemModel in
                    .init(article: article)
                }
                
                // セクションのキーを取得
                let sectionKeys = articleListItems.map {
                    $0.article.category.rawValue
                }.unique()
                
                // グルーピング
                let sectionedArticles = Dictionary(grouping: articleListItems) {
                    $0.article.category.rawValue
                }
                
                return sectionKeys.map { sectionKey in
                    (ArticleListSectionModel(title: sectionKey), sectionedArticles[sectionKey] ?? [])
                }
            }
            .eraseToAnyPublisher()

        return Output(
            articles: articles,
            loading: loadingSubject.eraseToAnyPublisher()
        )
    }
}
