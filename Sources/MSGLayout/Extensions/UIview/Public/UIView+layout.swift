import UIKit

public extension UIView {
    var layout: LayoutProvider {
        .init(view: self)
    }
}
