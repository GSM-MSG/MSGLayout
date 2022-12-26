import UIKit

public protocol CenterAnchorTrait {}
public protocol EdgeAnchorTrait {}
public protocol SizeAnchorTrait {}

public struct LayoutRelationAnchor<Trait>: Transformable {
    let shouldUseSuperview: Bool
    let anchorElement: LayoutAnchor?

    var xAxisAnchor: LayoutAnchor.XAxisAnchor?
    var yAxisAnchor: LayoutAnchor.YAxisAnchor?
    var sizeAnchor: LayoutAnchor.SizeAnchor?

    public static func to(_ anchor: LayoutAnchor) -> Self {
        .init(shouldUseSuperview: false, anchorElement: anchor)
    }

    public static func to(_ view: UIView) -> Self {
        .init(shouldUseSuperview: false, anchorElement: .init(view: view))
    }

    public static func toSuperview() -> Self {
        .init(shouldUseSuperview: true, anchorElement: nil)
    }
}

public extension LayoutRelationAnchor where Trait == CenterAnchorTrait {
    func positioned(
        x xAxis: LayoutAnchor.XAxisAnchor,
        y yAxis: LayoutAnchor.YAxisAnchor
    ) -> Self {
        transform {
            $0.xAxisAnchor = xAxis
            $0.yAxisAnchor = yAxis
        }
    }
}

public extension LayoutRelationAnchor where Trait == SizeAnchorTrait {
    var width: Self {
        transform {
            $0.sizeAnchor = .width
        }
    }

    var height: Self {
        transform {
            $0.sizeAnchor = .height
        }
    }
}

public extension LayoutRelationAnchor where Trait == LayoutAnchor.XAxisAnchor {
    var leading: Self {
        transform {
            $0.xAxisAnchor = .leading
        }
    }

    var trailing: Self {
        transform {
            $0.xAxisAnchor = .trailing
        }
    }

    var left: Self {
        transform {
            $0.xAxisAnchor = .left
        }
    }

    var right: Self {
        transform {
            $0.xAxisAnchor = .right
        }
    }

    var centerX: Self {
        transform {
            $0.xAxisAnchor = .centerX
        }
    }
}

public extension LayoutRelationAnchor where Trait == LayoutAnchor.YAxisAnchor {
    var top: Self {
        transform {
            $0.yAxisAnchor = .top
        }
    }

    var bottom: Self {
        transform {
            $0.yAxisAnchor = .bottom
        }
    }

    var centerY: Self {
        transform {
            $0.yAxisAnchor = .centerY
        }
    }
}
