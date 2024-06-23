//Copyright © 2024 MaakCode. All rights reserved.

import SwiftUI

@main
struct MainApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(\.isMovableByWindowBackground, true)
        .windowStyle(.hiddenTitleBar)
        .defaultPosition(.topTrailing)
    }
}

