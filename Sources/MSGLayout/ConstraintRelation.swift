import UIKit

/**
 Constraint's value relation
 */
public struct ConstraintRelation {
    /// Constraint's Relation enum
    /// Maximum / Equal / Minimum
    public enum Relation {
        case min
        case equal
        case max
    }

    /// Constraint's Relation
    public let relation: Relation
    /// Relation's value
    public let value: CGFloat
    /// Layout's priority
    public let priority: UILayoutPriority

    private init(
        relation: Relation,
        value: CGFloat,
        priority: UILayoutPriority
    ) {
        self.relation = relation
        self.value = value
        self.priority = priority
    }

    /// GreaterThan value
    public static func min(
        _ value: CGFloat,
        _ priority: UILayoutPriority = .required
    ) -> Self {
        .init(relation: .min, value: value, priority: priority)
    }

    /// Equal value
    public static func equal(
        _ value: CGFloat,
        _ priority: UILayoutPriority = .required
    ) -> Self {
        .init(relation: .equal, value: value, priority: priority)
    }

    /// LessThan value
    public static func max(
        _ value: CGFloat,
        _ priority: UILayoutPriority = .required
    ) -> Self {
        .init(relation: .max, value: value, priority: priority)
    }
}
