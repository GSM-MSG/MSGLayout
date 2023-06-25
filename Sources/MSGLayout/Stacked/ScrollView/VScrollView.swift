import UIKit

public final class VScrollView: StackedScrollView {
    public init(views: () -> [UIView]) {
        super.init(axis: .vertical, views: views)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
