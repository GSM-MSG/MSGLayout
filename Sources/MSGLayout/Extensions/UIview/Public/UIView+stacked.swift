import UIKit

public extension UIView {
    @discardableResult
    func stacked(
        _ axis: NSLayoutConstraint.Axis = .vertical,
        views: [UIView],
        spacing: CGFloat = .zero,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        ignoreSafeArea: Bool = false
    ) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.distribution = distribution
        addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        if ignoreSafeArea {
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: topAnchor, constant: .zero),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .zero),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .zero),
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .zero)
            ])
        } else {
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: .zero),
                stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: .zero),
                stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: .zero),
                stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: .zero)
            ])
        }

        return stackView
    }

    @discardableResult
    func scrollStacked(
        _ axis: NSLayoutConstraint.Axis = .vertical,
        views: [UIView],
        spacing: CGFloat = .zero,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        ignoreSafeArea: Bool = false
    ) -> StackedScrollView {
        let stackedScrollView = StackedScrollView(axis: axis, views: { views })
            .spacing(spacing)
            .alignment(alignment)
            .distribution(distribution)
        addSubview(stackedScrollView)

        stackedScrollView.translatesAutoresizingMaskIntoConstraints = false
        if ignoreSafeArea {
            NSLayoutConstraint.activate([
                stackedScrollView.topAnchor.constraint(equalTo: topAnchor, constant: .zero),
                stackedScrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .zero),
                stackedScrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .zero),
                stackedScrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .zero)
            ])
        } else {
            NSLayoutConstraint.activate([
                stackedScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: .zero),
                stackedScrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: .zero),
                stackedScrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: .zero),
                stackedScrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: .zero)
            ])
        }

        return stackedScrollView
    }
}
