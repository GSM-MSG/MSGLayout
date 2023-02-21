import UIKit

public struct LayoutProvider: SizeProvidable, Transformable {
    public var sizeProvider: SizeProvider = .init()

    private let target: LayoutAnchor
    private var proposedConstraints: [NSLayoutConstraint] = []

    init(view: UIView) {
        self.target = .init(view: view)
    }

    init(layoutGuide: UILayoutGuide) {
        self.target = .init(layoutGuide: layoutGuide)
    }

    private func getParentAnchorElement() -> LayoutAnchor? {
        assert(
            target.superview != nil,
            "\(target.view as Any) must have parent view."
        )
        return target.superview.map { .init(view: $0) }
    }
    
    private func getAnchorElement<T>(_ anchor: LayoutRelationAnchor<T>) -> LayoutAnchor? {
        guard !anchor.shouldUseSuperview else {
            return getParentAnchorElement()
        }
        return anchor.anchorElement
    }

    @discardableResult
    private mutating func makeConstraint<T>(
        anchor: LayoutRelationAnchor<T>,
        _ closure: (LayoutAnchor, LayoutAnchor) -> NSLayoutConstraint
    ) -> NSLayoutConstraint? {
        guard let anchorElement = getAnchorElement(anchor) else {
            return nil
        }

        let constraint = closure(target, anchorElement)
        proposedConstraints.append(constraint)
        return constraint
    }

    @discardableResult
    private mutating func makeConstraints<T>(
        anchor: LayoutRelationAnchor<T>,
        _ closure: (LayoutAnchor, LayoutAnchor) -> [NSLayoutConstraint]
    ) -> [NSLayoutConstraint]? {
        guard let anchorElement = getAnchorElement(anchor) else {
            return nil
        }

        let constraints = closure(target, anchorElement)
        proposedConstraints.append(contentsOf: constraints)
        return constraints
    }

    private func anchorXAxis<T>(
        from: LayoutAnchor.XAxisAnchor,
        anchor: LayoutRelationAnchor<T>,
        defaultAnchor: LayoutAnchor.XAxisAnchor,
        relation: ConstraintRelation
    ) -> Self {
        transform {
            $0.makeConstraint(anchor: anchor) {
                $0.anchor(from).constraint(
                    relation: relation,
                    to: $1.anchor(anchor.xAxisAnchor ?? defaultAnchor)
                )
            }
        }
    }

    private func anchorYAxis<T>(
        from: LayoutAnchor.YAxisAnchor,
        anchor: LayoutRelationAnchor<T>,
        defaultAnchor: LayoutAnchor.YAxisAnchor,
        relation: ConstraintRelation
    ) -> Self {
        transform {
            $0.makeConstraint(anchor: anchor) {
                $0.anchor(from).constraint(
                    relation: relation,
                    to: $1.anchor(anchor.yAxisAnchor ?? defaultAnchor)
                )
            }
        }
    }

    // MARK: - Anchor
    public func leading(
        _ anchor: LayoutRelationAnchor<LayoutAnchor.XAxisAnchor>,
        _ relation: ConstraintRelation = .equal(0)
    ) -> Self {
        anchorXAxis(from: .leading, anchor: anchor, defaultAnchor: .leading, relation: relation)
    }

    public func trailing(
        _ anchor: LayoutRelationAnchor<LayoutAnchor.XAxisAnchor>,
        _ relation: ConstraintRelation = .equal(0)
    ) -> Self {
        anchorXAxis(from: .trailing, anchor: anchor, defaultAnchor: .trailing, relation: relation)
    }

    public func left(
        _ anchor: LayoutRelationAnchor<LayoutAnchor.XAxisAnchor>,
        _ relation: ConstraintRelation = .equal(0)
    ) -> Self {
        anchorXAxis(from: .left, anchor: anchor, defaultAnchor: .left, relation: relation)
    }

    public func right(
        _ anchor: LayoutRelationAnchor<LayoutAnchor.XAxisAnchor>,
        _ relation: ConstraintRelation = .equal(0)
    ) -> Self {
        anchorXAxis(from: .right, anchor: anchor, defaultAnchor: .right, relation: relation)
    }

    public func centerX(
        _ anchor: LayoutRelationAnchor<LayoutAnchor.XAxisAnchor>,
        _ relation: ConstraintRelation = .equal(0)
    ) -> Self {
        anchorXAxis(from: .centerX, anchor: anchor, defaultAnchor: .centerX, relation: relation)
    }

    public func top(
        _ anchor: LayoutRelationAnchor<LayoutAnchor.YAxisAnchor>,
        _ relation: ConstraintRelation = .equal(0)
    ) -> Self {
        anchorYAxis(from: .top, anchor: anchor, defaultAnchor: .top, relation: relation)
    }

    public func bottom(
        _ anchor: LayoutRelationAnchor<LayoutAnchor.YAxisAnchor>,
        _ relation: ConstraintRelation = .equal(0)
    ) -> Self {
        anchorYAxis(from: .bottom, anchor: anchor, defaultAnchor: .bottom, relation: relation)
    }

    public func centerY(
        _ anchor: LayoutRelationAnchor<LayoutAnchor.YAxisAnchor>,
        _ relation: ConstraintRelation = .equal(0)
    ) -> Self {
        anchorYAxis(from: .centerY, anchor: anchor, defaultAnchor: .centerY, relation: relation)
    }

    public func width(
        _ anchor: LayoutRelationAnchor<SizeAnchorTrait>,
        _ relation: ConstraintRelation = .equal(0),
        multiplier: CGFloat = 1
    ) -> Self {
        transform {
            $0.makeConstraint(anchor: anchor) {
                $0.widthAnchor.constraint(
                    multiplier: multiplier,
                    relation: relation,
                    to: $1.anchor(anchor.sizeAnchor ?? .width)
                )
            }
        }
    }

    public func height(
        _ anchor: LayoutRelationAnchor<SizeAnchorTrait>,
        _ relation: ConstraintRelation = .equal(0),
        multiplier: CGFloat = 1
    ) -> Self {
        transform {
            $0.makeConstraint(anchor: anchor) {
                $0.heightAnchor.constraint(
                    multiplier: multiplier,
                    relation: relation,
                    to: $1.anchor(anchor.sizeAnchor ?? .height)
                )
            }
        }
    }

    public func center(
        _ anchor: LayoutRelationAnchor<CenterAnchorTrait>,
        _ relation: ConstraintRelation = .equal(0)
    ) -> Self {
        transform {
            $0.makeConstraints(anchor: anchor) {
                [
                    $0.anchor(.centerY).constraint(
                        relation: relation,
                        to: $1.anchor(anchor.yAxisAnchor ?? .centerY)
                    ),
                    $0.anchor(.centerX).constraint(
                        relation: relation,
                        to: $1.anchor(anchor.xAxisAnchor ?? .centerX)
                    )
                ]
            }
        }
    }

    public func edges(
        _ anchor: LayoutRelationAnchor<EdgeAnchorTrait>,
        _ relation: ConstraintRelation = .equal(0)
    ) -> Self {
        transform {
            $0.makeConstraints(anchor: anchor) {
                [
                    $0.anchor(.top).constraint(relation: relation, to: $1.topAnchor),
                    $1.anchor(.bottom).constraint(relation: relation, to: $0.bottomAnchor),
                    $0.anchor(.left).constraint(relation: relation, to: $1.leftAnchor),
                    $1.anchor(.right).constraint(relation: relation, to: $0.rightAnchor)
                ]
            }
        }
    }

    public func horizontal(
        _ anchor: LayoutRelationAnchor<EdgeAnchorTrait>,
        _ relation: ConstraintRelation = .equal(0)
    ) -> Self {
        transform {
            $0.makeConstraints(anchor: anchor) {
                [
                    $0.anchor(.left).constraint(relation: relation, to: $1.leftAnchor),
                    $1.anchor(.right).constraint(relation: relation, to: $0.rightAnchor)
                ]
            }
        }
    }

    public func vertical(
        _ anchor: LayoutRelationAnchor<EdgeAnchorTrait>,
        _ relation: ConstraintRelation = .equal(0)
    ) -> Self {
        transform {
            $0.makeConstraints(anchor: anchor) {
                [
                    $0.anchor(.top).constraint(relation: relation, to: $1.topAnchor),
                    $1.anchor(.bottom).constraint(relation: relation, to: $0.bottomAnchor)
                ]
            }
        }
    }

    @discardableResult
    public func activate() -> LayoutProvider {
        target.view?.translatesAutoresizingMaskIntoConstraints = false
        let constraints = assembleConstraints()
        NSLayoutConstraint.activate(constraints)
        return self
    }

    @discardableResult
    public func removeConstraints() -> LayoutProvider {
        target.view?.removeAllConstraints()
        return self
    }

    private func assembleConstraints() -> [NSLayoutConstraint] {
        let sizeConstraints = sizeProvider.makeConstraints(for: target)
        return proposedConstraints + sizeConstraints
    }
}

private extension NSLayoutDimension {
    func constraint(
        multiplier: CGFloat,
        relation: ConstraintRelation,
        to anchor: NSLayoutDimension
    ) -> NSLayoutConstraint {
        switch relation.relation {
        case .min:
            return constraint(
                equalTo: anchor,
                multiplier: multiplier,
                constant: relation.value
            )
            .setPriority(relation.priority)

        case .equal:
            return constraint(
                equalTo: anchor,
                multiplier: multiplier,
                constant: relation.value
            )
            .setPriority(relation.priority)

        case .max:
            return constraint(
                equalTo: anchor,
                multiplier: multiplier,
                constant: relation.value
            )
            .setPriority(relation.priority)
        }
    }
}

private extension NSLayoutXAxisAnchor {
    func constraint(
        relation: ConstraintRelation,
        to anchor: NSLayoutXAxisAnchor
    ) -> NSLayoutConstraint {
        switch relation.relation {
        case .min:
            return constraint(
                greaterThanOrEqualTo: anchor,
                constant: relation.value
            )
            .setPriority(relation.priority)

        case .equal:
            return constraint(
                equalTo: anchor,
                constant: relation.value
            )
            .setPriority(relation.priority)

        case .max:
            return constraint(
                lessThanOrEqualTo: anchor,
                constant: relation.value
            )
            .setPriority(relation.priority)
        }
    }
}


private extension NSLayoutYAxisAnchor {
    func constraint(
        relation: ConstraintRelation,
        to anchor: NSLayoutYAxisAnchor
    ) -> NSLayoutConstraint {
        switch relation.relation {
        case .min:
            return constraint(
                greaterThanOrEqualTo: anchor,
                constant: relation.value
            )
            .setPriority(relation.priority)

        case .equal:
            return constraint(
                equalTo: anchor,
                constant: relation.value
            )
            .setPriority(relation.priority)

        case .max:
            return constraint(
                lessThanOrEqualTo: anchor,
                constant: relation.value
            )
            .setPriority(relation.priority)
        }
    }
}
