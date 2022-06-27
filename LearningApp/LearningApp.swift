//
//  LearningApp.swift
//  LearningApp
//
//  Created by Tony Dinh on 6/27/22.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
