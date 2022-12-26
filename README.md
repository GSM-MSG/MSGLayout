# MSGLayout

A Swift AutoLayout DSL for iOS and MSG.

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
    - [Quick Start](#quick-start)

## Requirements
- iOS 11.0+ / tvOS 11.0+
- Swift 5.4+


## Overview
---


## Communication
---

- If you found a bug, open an issue.
- If you have a feature request, open an issue.
 - If you want to contribute, submit a pull request.


## Installation
---

### Swift Package Manager
[Swift Package Manager](https://www.swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

To integrate `MSGLayout` into your Xcode project using Swift Package Manager, add it to the dependencies value of your Package.swift:

```swift
dependencies: [
    .package(url: "https://github.com/GSM-MSG/MSGLayout.git", .upToNextMajor(from: "1.0.0"))
]
```

### Manually
If you prefer not to use either of the aforementioned dependency managers, you can integrate SnapKit into your project manually.

## Usage
---

### Quick Start
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

        MSGLayout.buildLayout {
            redView.layout
                .center(.toSuperView())
                .size(50)

            greenView.layout
                .top(.to(redView).bottom, .equal(30))
                .leading(.to(redView).trailing, .equal(30))
                .size(30)
        }
    }
}
```

