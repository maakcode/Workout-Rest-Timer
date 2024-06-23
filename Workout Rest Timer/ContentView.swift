//Copyright © 2024 MaakCode. All rights reserved.

import SwiftUI

struct ContentView: View {
    @Environment(\.stayOnTop) var stayOnTop
    @State private var currentTime = Date.now
    @State private var isStayOnTop = false
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()


    var body: some View {
        VStack {
            WatchFaceView(time: currentTime)
            Toggle("Stay on top", isOn: $isStayOnTop)
        }
        .padding()
        .onChange(of: isStayOnTop, initial: false) { _, _ in
            stayOnTop()
        }
        .onReceive(timer) { _ in
            currentTime = .now
        }
    }
}

#Preview {
    ContentView()
}
