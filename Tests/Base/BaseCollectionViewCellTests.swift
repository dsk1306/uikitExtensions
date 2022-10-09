import Combine
import CombineExtensions
import XCTest
import UIKit
import UIKitExtensions

final class BaseCollectionViewCellTests: XCTestCase {

    // MARK: - Properties

    private var cell = MockCollectionViewCell()

    // MARK: - Base Class

    override func setUp() {
        super.setUp()

        cell = .init()
    }

    // MARK: - Tests

    func test_init() {
        XCTAssertEqual(cell.numberOfConfigureSubviewsCalls, 1)
        XCTAssertEqual(cell.numberOfReusableBindCalls, 1)
    }

    func test_reuse() {
        XCTAssertEqual(cell.numberOfConfigureSubviewsCalls, 1)
        XCTAssertEqual(cell.numberOfReusableBindCalls, 1)

        cell.prepareForReuse()

        XCTAssertEqual(cell.numberOfConfigureSubviewsCalls, 1)
        XCTAssertEqual(cell.numberOfReusableBindCalls, 2)

        let subject = PassthroughSubject<Int, Never>()
        let cancelSubscriptionExpectation = expectation(description: "\(#function)DidCancel")

        cell.reusableCancellable {
            subject
                .handleEvents(receiveCancel: {
                    cancelSubscriptionExpectation.fulfill()
                })
                .sinkValue { _ in }
        }
        subject.send(1)
        cell.prepareForReuse()

        wait(for: [cancelSubscriptionExpectation], timeout: Constant.timeout)
        XCTAssertEqual(cell.numberOfConfigureSubviewsCalls, 1)
        XCTAssertEqual(cell.numberOfReusableBindCalls, 3)
    }

}

// MARK: - Constants

private extension BaseCollectionViewCellTests {

    enum Constant {

        static let timeout: TimeInterval = 5

    }

}

// MARK: - Mock Cell

private extension BaseCollectionViewCellTests {

    final class MockCollectionViewCell: BaseCollectionViewCell {

        var numberOfConfigureSubviewsCalls = 0
        var numberOfReusableBindCalls = 0

        override func configureSubviews() {
            super.configureSubviews()

            numberOfConfigureSubviewsCalls += 1
        }

        override func reusableBind() {
            super.reusableBind()

            numberOfReusableBindCalls += 1
        }

    }

}
