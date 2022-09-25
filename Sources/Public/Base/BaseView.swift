import UIKit

/// Base class for all views.
open class BaseView: UIView {

    // MARK: - Initialization

    public override init(frame: CGRect) {
        super.init(frame: frame)

        configureSubviews()
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public

    /// Configures cell subviews.
    open func configureSubviews() {}

}
