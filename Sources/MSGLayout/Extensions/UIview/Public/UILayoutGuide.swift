import UIKit

public extension UILayoutGuide {
    var layout: LayoutProvider {
        .init(layoutGuide: self)
    }
}
