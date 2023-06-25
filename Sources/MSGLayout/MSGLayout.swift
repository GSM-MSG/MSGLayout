import UIKit

/**
 Structure for activating constraints
 */
public struct MSGLayout {
    @discardableResult
    public static func buildLayout(
        @MSGLayoutBuilder _ closure: () -> [LayoutProvider]
    ) -> [LayoutProvider] {
        let providers = closure()
        providers.forEach {
            $0.activate()
        }
        return providers
    }

    @discardableResult
    public static func rebuildLayout(
        @MSGLayoutBuilder _ closure: () -> [LayoutProvider]
    ) -> [LayoutProvider] {
        let providers = closure()
        providers.forEach {
            $0.removeConstraints()
            $0.activate()
        }
        return providers
    }

    public static func stackedLayout(
        _ root: UIView,
        axis: NSLayoutConstraint.Axis = .vertical,
        spacing: CGFloat = .zero,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        ignoreSafeArea: Bool = false,
        @UIViewSubviewsBuilder _ closure: () -> [UIView]
    ) {
        root.stacked(
            axis,
            views: closure(),
            spacing: spacing,
            alignment: alignment,
            distribution: distribution,
            ignoreSafeArea: ignoreSafeArea
        )
    }

    public static func stackedScrollLayout(
        _ root: UIView,
        axis: NSLayoutConstraint.Axis = .vertical,
        spacing: CGFloat = .zero,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        ignoreSafeArea: Bool = false,
        @UIViewSubviewsBuilder _ closure: () -> [UIView]
    ) {
        root.scrollStacked(
            axis,
            views: closure(),
            spacing: spacing,
            alignment: alignment,
            distribution: distribution,
            ignoreSafeArea: ignoreSafeArea
        )
    }
}
