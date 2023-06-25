import UIKit

open class StackedScrollView: UIView {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    public init(
        axis: NSLayoutConstraint.Axis = .vertical,
        @UIViewSubviewsBuilder views: () -> [UIView]
    ) {
        super.init(frame: .zero)
        self.addSubview(scrollView)
        scrollView.addSubview(stackView)

        self.stackView.axis = axis

        if axis == .vertical {
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        } else {
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        }

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.topAnchor.constraint(equalTo:topAnchor),

            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor)
        ])

        stackView.addArrangedSubViews(views())
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension StackedScrollView {
    @discardableResult
    func spacing(_ spacing: CGFloat) -> Self {
        stackView.spacing = spacing
        return self
    }

    @discardableResult
    func margin(_ margins: UIEdgeInsets) -> Self {
        stackView.margin(margins)
        return self
    }

    @discardableResult
    func alignment(_ alignment: UIStackView.Alignment) -> Self {
        stackView.alignment = alignment
        return self
    }

    @discardableResult
    func distribution(_ distribution: UIStackView.Distribution) -> Self {
        stackView.distribution = distribution
        return self
    }

    @discardableResult
    func showVerticalIndicators(_ value: Bool) -> Self {
        scrollView.showsVerticalScrollIndicator = value
        return self
    }

    @discardableResult
    func showHorizontalIndicators(_ value: Bool) -> Self {
        scrollView.showsHorizontalScrollIndicator = value
        return self
    }

    @discardableResult
    func alwaysBounceHorizontal(_ value: Bool) -> Self {
        scrollView.alwaysBounceHorizontal = value
        return self
    }

    @discardableResult
    func alwaysBounceVertical(_ value: Bool) -> Self {
        scrollView.alwaysBounceVertical = value
        return self
    }

    @discardableResult
    func scrollViewDelegate(_ delegate: UIScrollViewDelegate) -> Self {
        scrollView.delegate = delegate
        return self
    }
}
