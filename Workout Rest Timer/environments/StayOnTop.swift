//Copyright © 2024 MaakCode. All rights reserved.

import SwiftUI
#if os(macOS)
import AppKit
#endif

extension EnvironmentValues {
    var isStayOnTop: Bool {
        get {
            #if canImport(AppKit)
            return NSApplication.shared.windows.allSatisfy {
                $0.level == .floating
            }
            #else
            return false
            #endif
        }
        set {
            #if canImport(AppKit)
            NSApplication.shared.windows.forEach { window in
                window.level = newValue ? .floating : .normal
            }
            #endif
        }
    }
}
