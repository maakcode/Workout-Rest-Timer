//Copyright © 2024 MaakCode. All rights reserved.

import SwiftUI

struct ContentView: View {
    @Environment(\.isStayOnTop) var isStayOnTop
    @Binding var stayOnTop: Bool
    @State private var currentTime = Date.now
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            WatchFaceView(time: currentTime)
            Toggle("Stay on top", isOn: $stayOnTop)
        }
        .padding()
        .onReceive(timer) { _ in
            currentTime = .now
        }
        .onChange(of: stayOnTop) { oldValue, newValue in
            guard newValue, !isStayOnTop else { return }

            stayOnTop = false
        }
    }
}

#Preview {
    ContentView(stayOnTop: .constant(false))
}
