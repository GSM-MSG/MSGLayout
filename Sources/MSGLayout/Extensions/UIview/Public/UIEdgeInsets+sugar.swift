import UIKit

public extension UIEdgeInsets {
    static func insets(
        top: CGFloat = .zero,
        left: CGFloat = .zero,
        bottom: CGFloat = .zero,
        right: CGFloat = .zero
    ) -> Self {
        UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }

    static func all(_ value: CGFloat) -> Self {
        UIEdgeInsets(top: value, left: value, bottom: value, right: value)
    }

    // MARK: - Axis

    static func axes(vertical: CGFloat = .zero, horizontal: CGFloat = .zero) -> Self {
        UIEdgeInsets(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }

    static func horizontal(_ value: CGFloat) -> Self {
        UIEdgeInsets(top: .zero, left: value, bottom: .zero, right: value)
    }

    static func vertical(_ value: CGFloat) -> Self {
        UIEdgeInsets(top: value, left: .zero, bottom: value, right: .zero)
    }

    // MARK: - Individual edges

    static func top(_ value: CGFloat) -> Self {
        UIEdgeInsets(top: value, left: .zero, bottom: .zero, right: .zero)
    }

    static func left(_ value: CGFloat) -> Self {
        UIEdgeInsets(top: .zero, left: value, bottom: .zero, right: .zero)
    }

    static func bottom(_ value: CGFloat) -> Self {
        UIEdgeInsets(top: .zero, left: .zero, bottom: value, right: .zero)
    }

    static func right(_ value: CGFloat) -> Self {
        UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: value)
    }

    // MARK: - Individual with other

    static func top(_ value: CGFloat, other: CGFloat) -> Self {
        return UIEdgeInsets(top: value, left: other, bottom: other, right: other)
    }

    static func left(_ value: CGFloat, other: CGFloat) -> Self {
        return UIEdgeInsets(top: other, left: value, bottom: other, right: other)
    }

    static func bottom(_ value: CGFloat, other: CGFloat) -> Self {
        return UIEdgeInsets(top: other, left: other, bottom: value, right: other)
    }

    static func right(_ value: CGFloat, other: CGFloat) -> Self {
        return UIEdgeInsets(top: other, left: other, bottom: other, right: value)
    }
}
