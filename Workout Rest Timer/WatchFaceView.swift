//Copyright © 2024 MaakCode. All rights reserved.

import SwiftUI

struct WatchFaceView: View {
    let time: Date

    var body: some View {
        GeometryReader { geometry in
            let fontSize = min(geometry.size.width * 0.2, geometry.size.height)

            Text(time, format: .dateTime.hour().minute().second())
                .font(.system(size: fontSize))
                .fontWeight(.bold)
                .fontDesign(.monospaced)
                .lineLimit(1)
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    VStack {
        WatchFaceView(time: .now)
    }.frame(width: 500, height: 100, alignment: .center)
}
