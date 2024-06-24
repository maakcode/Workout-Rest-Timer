//Copyright © 2024 MaakCode. All rights reserved.

import SwiftUI

@main
struct MainApp: App {
    @State private var isStayOnTop = false

    var body: some Scene {
        WindowGroup {
            ContentView(stayOnTop: $isStayOnTop)
        }
        .environment(\.isMovableByWindowBackground, true)
        .environment(\.isStayOnTop, isStayOnTop)
        .windowStyle(.hiddenTitleBar)
        .defaultPosition(.topTrailing)
    }
}

