import XCTest
import UIKit
import UIKitExtensions

final class BaseViewTests: XCTestCase {

    // MARK: - Properties

    private var view = MockView()

    // MARK: - Base Class

    override func setUp() {
        super.setUp()

        view = .init()
    }

    // MARK: - Tests

    func test_init() {
        XCTAssertEqual(view.numberOfConfigureSubviewsCalls, 1)
    }

}

// MARK: - Mock View

private extension BaseViewTests {

    final class MockView: BaseView {

        var numberOfConfigureSubviewsCalls = 0

        override func configureSubviews() {
            super.configureSubviews()

            numberOfConfigureSubviewsCalls += 1
        }

    }

}
