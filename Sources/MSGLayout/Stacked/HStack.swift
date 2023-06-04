import UIKit

public final class HStack: UIStackView {
    public init(
        spacing: CGFloat = 0,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        @UIViewSubviewsBuilder _ views: () -> [UIView]
    ) {
        super.init(frame: .zero)
        self.axis = .horizontal
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution

        self.addArrangedSubViews(views())
    }

    public required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
