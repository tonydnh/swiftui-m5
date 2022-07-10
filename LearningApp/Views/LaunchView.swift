//
//  LaunchView.swift
//  LearningApp
//
//  Created by Tony Dinh on 7/9/22.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
        
    var body: some View {
        
        if model.loggedIn == false {
            // Show login view
            LoginView()
                .onAppear {
                    // Check if the user is logged in or out
                    model.checkLogin()
                }
        }
        else {
            // Show the logged in view
            TabView {
                
                HomeView()
                    .tabItem {
                        VStack {
                            Image(systemName: "book")
                            Text("Learn")
                        }
                    }
                
                ProfileView()
                    .tabItem {
                        VStack {
                            Image(systemName: "person")
                            Text("Learn")
                        }
                    }
            }
            .onAppear {
                model.getModules()
            }
            
        }
        
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
