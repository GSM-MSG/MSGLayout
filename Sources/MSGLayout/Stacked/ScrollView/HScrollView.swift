import UIKit

public final class HScrollView: StackedScrollView {
    public init(views: () -> [UIView]) {
        super.init(axis: .horizontal, views: views)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
