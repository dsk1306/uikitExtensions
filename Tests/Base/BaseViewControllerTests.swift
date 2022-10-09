import XCTest
import UIKit
import UIKitExtensions

final class BaseViewControllerTests: XCTestCase {

    // MARK: - Properties

    private var controller = MockViewController()

    // MARK: - Base Class

    override func setUp() {
        super.setUp()

        controller = .init()
    }

    // MARK: - Tests

    func test_init() {
        XCTAssertEqual(controller.numberOfConfigureSubviewsCalls, 0)
        XCTAssertEqual(controller.numberOfBindCalls, 0)

        controller.viewDidLoad()
        XCTAssertEqual(controller.numberOfConfigureSubviewsCalls, 1)
        XCTAssertEqual(controller.numberOfBindCalls, 1)
    }

}

// MARK: - Mock View Controller

private extension BaseViewControllerTests {

    final class MockViewController: BaseViewController {

        var numberOfConfigureSubviewsCalls = 0
        var numberOfBindCalls = 0

        override func configureSubviews() {
            super.configureSubviews()

            numberOfConfigureSubviewsCalls += 1
        }

        override func bind() {
            super.bind()

            numberOfBindCalls += 1
        }

    }
    
}
