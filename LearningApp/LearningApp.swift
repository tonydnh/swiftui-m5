//
//  LearningApp.swift
//  LearningApp
//
//  Created by Tony Dinh on 6/27/22.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

@main
struct LearningApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
