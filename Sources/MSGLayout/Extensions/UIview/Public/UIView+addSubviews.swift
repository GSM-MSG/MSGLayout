import UIKit

public extension UIView {
    @discardableResult
    func addSubviews(
        @UIViewSubviewsBuilder _ closure: () -> [UIView]
    ) -> [UIView] {
        let views = closure()
        views.forEach {
            self.addSubview($0)
        }
        return views
    }

    func addSubviews(_ views: UIView...) {
        views.forEach(self.addSubview(_:))
    }
}
