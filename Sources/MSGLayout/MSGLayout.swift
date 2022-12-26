import UIKit

/**
 Structure for activating constraints
 */
public struct MSGLayout {
    @discardableResult
    static func buildLayout(
        @MSGLayoutBuilder<LayoutProvider> _ closure: () -> [LayoutProvider]
    ) -> [LayoutProvider] {
        let providers = closure()
        providers.forEach {
            $0.activate()
        }
        return providers
    }

    @discardableResult
    static func rebuildLayout(
        @MSGLayoutBuilder<LayoutProvider> _ closure: () -> [LayoutProvider]
    ) -> [LayoutProvider] {
        let providers = closure()
        providers.forEach {
            $0.removeConstraints()
            $0.activate()
        }
        return providers
    }
}
