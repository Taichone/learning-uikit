# Learning UIKit App

## Clean Architecture + MVVM

### ViewModel
- 全ての ViewModel は `BaseViewModel` に継承させる


```
// BaseViewModel<HogeViewModel> を継承させて HogeViewModel を定義する
// PrimitiveBaseViewModel<HogeViewModel> であり、かつ ViewModelType に準拠したもの
typealias BaseViewModel<ViewModel: ViewModelType> = PrimitiveBaseViewModel<ViewModel> & ViewModelType

class PrimitiveBaseViewModel<ViewModel: ViewModelType> {
    var input: ViewModel.Input
    var output: ViewModel.Output

    private let state: ViewModel.State
    private let dependency: ViewModel.Dependency
    private var cancellables = Set<AnyCancellable>()

    init(input: ViewModel.Input, state: ViewModel.State, dependency: ViewModel.Dependency) {
        self.input = input
        self.output = ViewModel.bind(input: input, state: state, dependency: dependency, cancellables: &cancellables)
        self.state = state
        self.dependency = dependency
    }
}
```

- View からのイベントに応じてプレゼンテーションロジックを実行し､ View の状態を変更する
- 必要に応じて UseCase を用いてデータの取得や処理を行う
- Routerを所持することで､プレゼンテーションロジックによる処理後に画面遷移を行うことが可能

### View (Controller)
- 画面のレイアウトを行う
- 状態に応じて変化する要素は ViewModel に従う

### Router
- ViewModel から画面遷移の命令が来たら､別の Module への遷移を行う

### UseCase
- プレゼンテーションロジック以外のビジネスロジックの実装を行う
- データの変換処理や､データ取得処理等

### Entity
- アプリ内で共通のデータモデル
- API からのレスポンス等もここで Decodable に準拠したモデルにする

### Repository
- アプリ内で複数のモジュールで必要なデータや永続化が必要なデータを保持

### API
- 外部のAPIサーバーと通信を行う
