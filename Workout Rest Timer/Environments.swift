//Copyright © 2024 MaakCode. All rights reserved.

import SwiftUI
#if os(macOS)
import AppKit
#endif

private struct StayOnTop: EnvironmentKey {
    static let defaultValue: Bool = false
}

private struct MovableByWindowBackground: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var stayOnTop: Bool {
        get { self[StayOnTop.self] }
        set {
            self[StayOnTop.self] = newValue
            #if canImport(AppKit)
            NSApplication.shared.windows.forEach { window in
                window.level = newValue ? .floating : .normal
            }
            #endif
        }
    }

    var isMovableByWindowBackground: Bool {
        get { self[MovableByWindowBackground.self] }
        set {
            self[MovableByWindowBackground.self] = newValue
            #if canImport(AppKit)
            NSApplication.shared.windows.forEach { window in
                window.isMovableByWindowBackground = newValue
            }
            #endif
        }
    }
}
