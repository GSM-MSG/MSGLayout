import UIKit

public struct SizeProvider: Equatable {
    public struct ConstraintValue: Equatable {
        public var value: CGFloat
        public var priority: UILayoutPriority
    }
    
    public var aspectRatio: ConstraintValue?
    
    public var minHeight: ConstraintValue?
    public var minWidth: ConstraintValue?
    
    public var maxHeight: ConstraintValue?
    public var maxWidth: ConstraintValue?
    
    public var height: ConstraintValue?
    public var width: ConstraintValue?
    
    func makeConstraints(for view: LayoutAnchor) -> [NSLayoutConstraint] {
        var constraints: [NSLayoutConstraint] = []

        if let height {
            constraints.append(
                view.heightAnchor.constraint(equalToConstant: height.value)
                    .setPriority(height.priority)
            )
        }

        if let width {
            constraints.append(
                view.widthAnchor.constraint(equalToConstant: width.value)
                    .setPriority(width.priority)
            )
        }

        if let minHeight {
            constraints.append(
                view.heightAnchor.constraint(greaterThanOrEqualToConstant: minHeight.value)
                    .setPriority(minHeight.priority)
            )
        }

        if let minWidth {
            constraints.append(
                view.widthAnchor.constraint(greaterThanOrEqualToConstant: minWidth.value)
                    .setPriority(minWidth.priority)
            )
        }

        if let maxHeight {
            constraints.append(
                view.heightAnchor.constraint(lessThanOrEqualToConstant: maxHeight.value)
                    .setPriority(maxHeight.priority)
            )
        }

        if let maxWidth {
            constraints.append(
                view.widthAnchor.constraint(lessThanOrEqualToConstant: maxWidth.value)
                    .setPriority(maxWidth.priority)
            )
        }

        if let aspectRatio {
            constraints.append(
                view.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: aspectRatio.value)
                    .setPriority(aspectRatio.priority)
            )
        }

        return constraints
    }
}
