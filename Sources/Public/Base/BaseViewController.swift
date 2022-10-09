import UIKit

/// Base class for all view controllers.
open class BaseViewController: UIViewController {
    
    // MARK: - Initialization
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Base Class
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
        bind()
    }
    
    // MARK: - Public Methods
    
    /// Configures view subviews.
    open func configureSubviews() {}
    
    open func bind() {}
    
}
