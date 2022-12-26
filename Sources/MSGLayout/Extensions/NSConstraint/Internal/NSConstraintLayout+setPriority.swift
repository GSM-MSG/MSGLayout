import UIKit

extension NSLayoutConstraint {
    @discardableResult
    func setPriority(_ priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        return self
    }
}
