import UIKit

public protocol SizeProvidable {
    var sizeProvider: SizeProvider { get set }
}

public extension SizeProvidable {
    private func transform(_ modifier: (inout SizeProvider) -> Void) -> Self {
        var new = self
        modifier(&new.sizeProvider)
        return new
    }

    func height(_ relation: ConstraintRelation) -> Self {
        switch relation.relation {
        case .min:
            return transform {
                $0.minHeight = .init(value: relation.value, priority: relation.priority)
            }

        case .equal:
            return transform {
                $0.height = .init(value: relation.value, priority: relation.priority)
            }

        case .max:
            return transform {
                $0.maxHeight = .init(value: relation.value, priority: relation.priority)
            }
        }
    }
    
    @_disfavoredOverload
    func height(_ value: CGFloat) -> Self {
        height(.equal(value))
    }

    func width(_ relation: ConstraintRelation) -> Self {
        switch relation.relation {
        case .min:
            return transform {
                $0.minHeight = .init(value: relation.value, priority: relation.priority)
            }

        case .equal:
            return transform {
                $0.height = .init(value: relation.value, priority: relation.priority)
            }

        case .max:
            return transform {
                $0.maxHeight = .init(value: relation.value, priority: relation.priority)
            }
        }
    }

    @_disfavoredOverload
    func width(_ value: CGFloat) -> Self {
        width(.equal(value))
    }

    func size(
        width: ConstraintRelation,
        height: ConstraintRelation
    ) -> Self {
        self.width(width)
            .height(height)
    }

    func size(_ size: CGSize, priority: UILayoutPriority = .required) -> Self {
        transform {
            $0.width = .init(value: size.width, priority: priority)
            $0.height = .init(value: size.height, priority: priority)
        }
    }

    func size(_ value: CGFloat, priority: UILayoutPriority = .required) -> Self {
        transform {
            $0.width = .init(value: value, priority: priority)
            $0.height = .init(value: value, priority: priority)
        }
    }

    func aspectRatio(_ ratio: CGFloat, priority: UILayoutPriority = .required) -> Self {
        transform {
            $0.aspectRatio = .init(value: ratio, priority: priority)
        }
    }

    func aspectRatio(_ size: CGSize) -> Self {
        aspectRatio(size.width / size.height)
    }
}
