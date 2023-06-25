# MSGLayout

A Swift AutoLayout DSL for iOS in MSG Team.

[Document](https://gsm-msg.github.io/MSGLayout/documentation/msglayout/)

<br>

## Constents
- [MSGLayout](#msglayout)
  - [Constents](#constents)
  - [Requirements](#requirements)
  - [Overview](#overview)
  - [Communication](#communication)
  - [Installation](#installation)
    - [Swift Package Manager](#swift-package-manager)
    - [Manually](#manually)
  - [Usage](#usage)
    - [Quick Start - AutoLayout](#quick-start---autolayout)
    - [Quick Start - StackedLayout](#quick-start---stackedlayout)
    - [Detail API - AutoLayout](#detail-api---autolayout)
      - [where == LayoutAnchor.YAxisAnchor](#where--layoutanchoryaxisanchor)
      - [where == LayoutAnchor.XAxisAnchor](#where--layoutanchorxaxisanchor)
      - [where == SizeAnchorTrait](#where--sizeanchortrait)
      - [where == CenterAnchorTrait](#where--centeranchortrait)
    - [Detail API - StackedLayout](#detail-api---stackedlayout)

<br>

## Requirements
- iOS 11.0+ / tvOS 11.0+
- Swift 5.4+

<br>

## Overview
A Swift AutoLayouy DSL for iOS in MSG Team.


<br>

## Communication

- If you found a bug, open an issue.
- If you have a feature request, open an issue.
 - If you want to contribute, submit a pull request.


<br>

## Installation

### Swift Package Manager
[Swift Package Manager](https://www.swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

To integrate `MSGLayout` into your Xcode project using Swift Package Manager, add it to the dependencies value of your Package.swift:

```swift
dependencies: [
    .package(url: "https://github.com/GSM-MSG/MSGLayout.git", .upToNextMajor(from: "1.0.2"))
]
```

### Manually
If you prefer not to use either of the aforementioned dependency managers, you can integrate MSGLayout into your project manually.

<br>

## Usage

`MSGLayout` provides an API that allows you to configure the layout in several ways.
- `buildLayout(_layouts:)`
- `rebuildLayout(_layouts:)`
- `stackedLayout(_root:axis:spacing:alignment:distribution:ignoreSafeArea:closure:)`
- `stackedScrollLayout(_root:axis:spacing:alignment:distribution:ignoreSafeArea:closure:)`

### Quick Start - AutoLayout
```swift
import MSGLayout

final class ViewController: UIViewController {
    private let redView = UIView()
    private let greenView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        redView.backgroundColor = .red
        greenView.backgroundColor = .green

        view.addSubviews {
            redView
            greenView
        }

        redView.layout
            .center(.toSuperView())
            .size(50)
            .active()

        MSGLayout.buildLayout {
            greenView.layout
                .top(.to(redView).bottom, .equal(30))
                .leading(.to(redView).trailing, .equal(30))
                .size(30)
        }
    }
}
```

### Quick Start - StackedLayout
```swift
import MSGLayout

final class ViewController: UIViewController {
    private let redView = UIView()
    private let greenView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        redView.backgroundColor = .red
        greenView.backgroundColor = .green

        MSGLayout.stackedLayout(view, distribution: .fillEqually) {
            redView

            FlexibleSpacerView()

            HStackView {
                greenView

                SpacerView()
            }
        }
    }
}
```

### Detail API - AutoLayout

`\(UIView).layout` provides an API to build AutoLayout by returning a `LayoutProvider` type for `MSGLayout.buildLayout`.

`LayoutProvider` provides the following APIs

- `top(_anchor:_relation:)`
- `left(_anchor:_relation:)`
- `leading(_anchor:_relation:)`
- `right(_anchor:_relation:)`
- `trailing(_anchor:_relation:)`
- `bottom(_anchor:_relation:)`
- `centerX(_anchor:_relation:)`
- `centerY(_anchor:_relation:)`
- `center(_anchor:_relation:)`
- `width(_anchor:_relation:multiplier:)`
- `height(_anchor:_relation:multiplier:)`
- `edges(_anchor:_relation:)`
- `horizontal(_anchor:_relation:)`
- `vertical(_anchor:_relation:)`

`SizeProvider` provides the following APIs (`LayoutProvider` conforms to `SizeProvider`)
- `height(_relation:)`
- `height(_value:)`
- `width(_relation:)`
- `width(_value:)`
- `size(width:height)`
- `size(_size:priority:)`
- `size(_value:priority:)`
- `aspectRatio(_ratio:priority:)`
- `aspectRatio(_size:)`

<br>

`anchor` paramter takes a `LayoutRelationAnchor` as an argument.

<br>

`LayoutRelationAnchor` provides the following APIs

- `to(_:anchor)`
- `to(_:view)`
- `to(_:layoutGuide)`
- `toSuperview()`

usage
```swift
view.layout
    .top('\(LayoutRelationAnchor)')

// example
view.layout
    .top(.to(aView).bottom)
    .bottom(.toSuperview())
```

#### where == LayoutAnchor.YAxisAnchor
- `top`
- `bottom`
- `centerY`

#### where == LayoutAnchor.XAxisAnchor
- `leading`
- `left`
- `trailing`
- `right`
- `centerX`

#### where == SizeAnchorTrait
- `width`
- `height`

#### where == CenterAnchorTrait
- `positioned(x:y:)`

<br>

`ConstraintRelation` provides the following APIs

- `equal(_value:priority:)`
- `min(_value:priority:)`
- `max(_value:priority:)`

usage
```swift
view.layout
    .top('\(LayoutRelationAnchor)', '\(ConstraintRelation)')

// example
view.layout
    .top(.toSuperview(), .min(30))
    .bottom(.toSuperview(), .equal(30))
```

### Detail API - StackedLayout

Classes to support StackedLayout
- `VStackView(spacing:views:)`
- `HStackView(spacing:views:)`
- `ZStackView(spacing:views:)`
- `VScrollView(views:)`
- `HScrollView(views:)`
- `StackedScrollView(axis:views:)`
- `SpacerView(size:)`
- `SpacerView(width:)`
- `SpacerView(height:)`
- `FlexibleSpacerView()`
- `StackedScrollView(axis:views:)`

Extend UIStackView with additional extension APIs.

- `margin(_margins:)`
- `alignment(_alignment:)`
- `spacing(_spacing:)`
- `distribution(_distribution:)`

Extend UIView with additional extension APIs.

- `width(_width:)`
- `height(_height:)`

Extend StackedScrollView with additional extension APIs.

- `spacing(_spacing:)`
- `margin(_margins:)`
- `alignment(_alignment:)`
- `distribution(_distribution:)`
- `showsVerticalScrollIndicators(_value:)`
- `showsHorizontalScrollIndicators(_value:)`
- `alwaysBounceHorizontal(_value:)`
- `alwaysBounceVertical(_value:)`
- `scrollViewDelegate(_delegate:)`

<br>
<br>

Credits by [MondrianLayout](https://github.com/FluidGroup/MondrianLayout), [ios-stack-kit](https://github.com/gymshark/ios-stack-kit), [UStack](https://github.com/foxsin10/UStack)