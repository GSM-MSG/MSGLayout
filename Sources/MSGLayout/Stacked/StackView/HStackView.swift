import UIKit

public final class HStackView: UIStackView {
    public init(
        spacing: CGFloat = 0,
        @UIViewSubviewsBuilder _ views: () -> [UIView]
    ) {
        super.init(frame: .zero)
        self.axis = .horizontal
        self.spacing = spacing

        self.addArrangedSubViews(views())
    }

    public required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
