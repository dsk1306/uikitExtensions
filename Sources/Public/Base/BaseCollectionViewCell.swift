import Combine
import CombineExtensions
import UIKit

/// Base class for all collection view cells.
open class BaseCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    public var reusableCancellable: CombineCancellable { reusableCancellableRelay }
    
    private var reusableCancellableRelay = CombineCancellable()
    
    // MARK: - Initialization
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureSubviews()
        reusableBind()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Base Class
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        
        reusableCancellableRelay = CombineCancellable()
        reusableBind()
    }
    
    // MARK: - Public Methods
    
    /// Configures cell subviews.
    open func configureSubviews() {}
    
    open func reusableBind() {}
    
}
