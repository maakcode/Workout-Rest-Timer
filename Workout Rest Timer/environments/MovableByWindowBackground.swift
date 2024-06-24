//Copyright © 2024 MaakCode. All rights reserved.

import SwiftUI
#if os(macOS)
import AppKit
#endif

private struct MovableByWindowBackground: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
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
