//
//  Created by Adam Stragner
//

// MARK: - DispatchExecutor

final class DispatchExecutor: SerialExecutor {
    // MARK: Lifecycle

    init(_ queue: DispatchQueue) {
        self.queue = queue
    }

    // MARK: Internal

    func enqueue(_ job: UnownedJob) {
        let executor = asUnownedSerialExecutor()
        queue.async(execute: { job.runSynchronously(on: executor) })
    }

    func asUnownedSerialExecutor() -> UnownedSerialExecutor {
        UnownedSerialExecutor(ordinary: self)
    }

    // MARK: Private

    private let queue: DispatchQueue
}

// MARK: - DispatchQueue + Sendable

extension DispatchQueue: @unchecked Sendable {}
