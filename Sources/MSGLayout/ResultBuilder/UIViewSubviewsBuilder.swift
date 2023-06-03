import Foundation
import UIKit

/**
 UIViewSubviewsBuilder for UIView adding DSL
 */
@resultBuilder
public struct UIViewSubviewsBuilder {
    public typealias Element = UIView
    public static func buildBlock<C: Collection>(_ components: C...) -> [Element] where C.Element == Element {
        components.flatMap { $0 }
    }
    public static func buildOptional(_ component: [Element]?) -> [Element] {
        component ?? []
    }
    public static func buildEither(first component: [Element]) -> [Element] {
        component
    }
    public static func buildEither(second component: [Element]) -> [Element] {
        component
    }
    public static func buildArray(_ components: [[Element]]) -> [Element] {
        components.flatMap { $0 }
    }
    public static func buildExpression(_ expression: Element?) -> [Element] {
        expression.map { [$0] } ?? []
    }
    public static func buildExpression(_ expression: Element) -> [Element] {
        [expression]
    }
    public static func buildExpression<C: Collection>(_ expression: C) -> [Element] where C.Element == Element {
        Array(expression)
    }
    public static func buildExpression<C: Collection>(_ expression: C) -> [Element] where C.Element == Optional<Element> {
        expression.compactMap { $0 }
    }
    public static func buildLimitedAvailability(_ component: [Element]) -> [Element] {
        component
    }
}
