//
//  Created by Adam Stragner
//

// MARK: - DispatchActor

public final actor DispatchActor: Actor {
    // MARK: Lifecycle

    init(_ queue: DispatchQueue) {
        self.executor = DispatchExecutor(queue)
    }

    // MARK: Public

    public nonisolated var unownedExecutor: UnownedSerialExecutor {
        executor.asUnownedSerialExecutor()
    }

    // MARK: Private

    private let executor: DispatchExecutor
}
