//Copyright © 2024 MaakCode. All rights reserved.

import SwiftUI
#if os(macOS)
import AppKit
#endif

private struct StayOnTop: EnvironmentKey {
    static let defaultValue: StayOnTopAction = StayOnTopAction()
}

extension EnvironmentValues {
    var stayOnTop: StayOnTopAction {
        get { self[StayOnTop.self] }
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
