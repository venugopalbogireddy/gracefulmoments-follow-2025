//
//  GracefulMomentsApp.swift
//  GracefulMoments
//
//  Created by Venugopal Bogireddy on 11/30/25.
//

import SwiftUI
import SwiftData


@main
struct GratefulMomentsApp: App {
    let dataContainer = DataContainer()


    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataContainer)
        }
        .modelContainer(dataContainer.modelContainer)
    }
}
