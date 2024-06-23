//Copyright © 2024 MaakCode. All rights reserved.

import SwiftUI

struct ContentView: View {
    @State private var currentTime = Date.now
    @State private var isStayOnTop = false
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()


    var body: some View {
        VStack {
            WatchFaceView(time: currentTime)
            Toggle("Stay on top", isOn: $isStayOnTop)
        }
        .padding()
        .onReceive(timer) { _ in
            currentTime = .now
        }
        .environment(\.stayOnTop, isStayOnTop)
    }
}

#Preview {
    ContentView()
}
