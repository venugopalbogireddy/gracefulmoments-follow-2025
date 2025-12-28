//
//  Hexagon.swift
//  GracefulMoments
//
//  Created by Venugopal Bogireddy on 12/27/25.
//

import SwiftUI


struct Hexagon<Content: View>: View {
    private let boarderWidth = 2.0
    var boarderColor: Color = .ember
    var layout: HexagonLayout = .standard
    var moment: Moment? = nil
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        ZStack {
            if let background = moment?.image {
                Image(uiImage: background)
                    .resizable()
                    .scaledToFill()
            }
            content()
                .frame(width: layout.size, height: layout.size)
        }
        .mask {
            Image(systemName: "hexagon.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: layout.size - boarderWidth, height: layout.size - boarderWidth)
        }
        .background {
            Image(systemName: "hexagon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: layout.size, height: layout.size)
                .foregroundStyle(boarderColor)
        }
        .frame(width: layout.size, height: layout.size)
    }
}


#Preview {
    Hexagon(moment: Moment.imageSample) {
        Text(Moment.imageSample.title)
            .foregroundStyle(Color.white)
    }
    .sampleDataContainer()
}
