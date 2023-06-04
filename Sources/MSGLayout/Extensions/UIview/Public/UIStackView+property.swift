import UIKit

public extension UIStackView {
    @discardableResult
    func margin(_ margins: UIEdgeInsets) -> UIStackView {
        self.layoutMargins = margins
        self.isLayoutMarginsRelativeArrangement = true
        return self
    }

    @discardableResult
    func alignment(_ alignment: UIStackView.Alignment) -> UIStackView {
        self.alignment = alignment
        return self
    }

    @discardableResult
    func spacing(_ spacing: CGFloat) -> UIStackView {
        self.spacing = spacing
        return self
    }

    @discardableResult
    func distribution(_ distribution: UIStackView.Distribution) -> UIStackView {
        self.distribution = distribution
        return self
    }
}
