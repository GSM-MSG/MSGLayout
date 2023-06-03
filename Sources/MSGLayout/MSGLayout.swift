import UIKit

/**
 Structure for activating constraints
 */
public struct MSGLayout {
    @discardableResult
    public static func buildLayout(
        @MSGLayoutBuilder _ closure: () -> [LayoutProvider]
    ) -> [LayoutProvider] {
        let providers = closure()
        providers.forEach {
            $0.activate()
        }
        return providers
    }

    @discardableResult
    public static func rebuildLayout(
        @MSGLayoutBuilder _ closure: () -> [LayoutProvider]
    ) -> [LayoutProvider] {
        let providers = closure()
        providers.forEach {
            $0.removeConstraints()
            $0.activate()
        }
        return providers
    }
}
