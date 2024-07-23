//
//  PublisherExtension.swift
//  LearningUIKit
//
//  Created by Taichi on 2024/07/22.
//

import Combine
import Foundation

extension Publisher where Self.Failure == Never {
    /// sink メソッド内のクロージャを async Task で実行。 Cancellable のライフサイクルに合わせて Task も Cancel される。
    func sinkByAsync(receiveValue: @escaping (Output) async -> Void) -> AnyCancellable {
        var task: Task<Void, Never>?

        let cancellable = sink { value in
            task = Task { await receiveValue(value) }
        }

        return AnyCancellable { [task, cancellable] in
            task?.cancel()
            cancellable.cancel()
        }
    }
}
