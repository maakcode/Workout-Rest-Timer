//Copyright © 2024 MaakCode. All rights reserved.

import SwiftUI
#if os(macOS)
import AppKit
#endif

private struct StayOnTop: EnvironmentKey {
    static let defaultValue: StayOnTopAction = StayOnTopAction()
}

private struct MovableByWindowBackground: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var stayOnTop: StayOnTopAction {
        get { self[StayOnTop.self] }
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

struct StayOnTopAction {
    func callAsFunction() {
#if canImport(AppKit)
        NSApplication.shared.windows.forEach { window in
            window.level = window.level == .floating ? .normal : .floating
        }
#endif
    }
}
