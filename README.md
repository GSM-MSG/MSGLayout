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