import UIKit

final class FlexableSpacer: UIView {
    public init() {
        super.init(frame: .zero)
        self.setContentHuggingPriority(.fittingSizeLevel, for: .horizontal)
        self.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
        self.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
        self.setContentCompressionResistancePriority(.fittingSizeLevel, for: .vertical)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
