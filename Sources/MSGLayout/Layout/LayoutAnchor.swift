import UIKit

public struct LayoutAnchor {
    public enum XAxisAnchor: Equatable {
        case left
        case right
        case leading
        case trailing
        case centerX
    }

    public enum SizeAnchor: Equatable {
        case width
        case height
    }

    public enum YAxisAnchor: Equatable {
        case top
        case bottom
        case centerY
    }

    let leftAnchor: NSLayoutXAxisAnchor
    let rightAnchor: NSLayoutXAxisAnchor
    let leadingAnchor: NSLayoutXAxisAnchor
    let trailingAnchor: NSLayoutXAxisAnchor
    let centerXAnchor: NSLayoutXAxisAnchor

    let widthAnchor: NSLayoutDimension
    let heightAnchor: NSLayoutDimension

    let topAnchor: NSLayoutYAxisAnchor
    let bottomAnchor: NSLayoutYAxisAnchor
    let centerYAnchor: NSLayoutYAxisAnchor

    var superview: UIView? {
        return view?.superview ?? layoutGuide?.owningView
    }

    let view: UIView?
    let layoutGuide: UILayoutGuide?

    init(view: UIView) {
        self.view = view
        self.layoutGuide = nil
        
        leadingAnchor = view.leadingAnchor
        trailingAnchor = view.trailingAnchor
        leftAnchor = view.leftAnchor
        rightAnchor = view.rightAnchor
        centerXAnchor = view.centerXAnchor
        
        widthAnchor = view.widthAnchor
        heightAnchor = view.heightAnchor
        
        topAnchor = view.topAnchor
        bottomAnchor = view.bottomAnchor
        centerYAnchor = view.centerYAnchor
    }

    init(layoutGuide: UILayoutGuide) {
        self.view = nil
        self.layoutGuide = layoutGuide

        leadingAnchor = layoutGuide.leadingAnchor
        trailingAnchor = layoutGuide.trailingAnchor
        leftAnchor = layoutGuide.leftAnchor
        rightAnchor = layoutGuide.rightAnchor
        centerXAnchor = layoutGuide.centerXAnchor
        
        widthAnchor = layoutGuide.widthAnchor
        heightAnchor = layoutGuide.heightAnchor
        
        topAnchor = layoutGuide.topAnchor
        bottomAnchor = layoutGuide.bottomAnchor
        centerYAnchor = layoutGuide.centerYAnchor
    }

    func anchor(_ type: XAxisAnchor) -> NSLayoutXAxisAnchor {
        switch type {
        case .right:
            return rightAnchor
        case .left:
            return leftAnchor
        case .leading:
            return leadingAnchor
        case .trailing:
            return trailingAnchor
        case .centerX:
            return centerXAnchor
        }
    }

    func anchor(_ type: YAxisAnchor) -> NSLayoutYAxisAnchor {
        switch type {
        case .top:
            return topAnchor
        case .bottom:
            return bottomAnchor
        case .centerY:
            return centerYAnchor
        }
    }

    func anchor(_ type: SizeAnchor) -> NSLayoutDimension {
        switch type {
        case .width:
            return widthAnchor
        case .height:
            return heightAnchor
        }
    }
}
