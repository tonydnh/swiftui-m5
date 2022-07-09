//
//  ContentView.swift
//  LearningApp
//
//  Created by Tony Dinh on 6/27/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model:ContentModel
        
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                // Confirm that currentModule is set
                if model.currentModule != nil {
                    
                    ForEach(0..<model.currentModule!.content.lessons.count, id: \.self) { i in
                        
                        NavigationLink {
                            ContentDetailView()
                                .onAppear {
                                    model.beginLesson(i)
                                }
                        } label: {
                            ContentViewRow(i: i)
                        }
                        
                    }
                    
                }
                
            }
            .padding()
            .foregroundColor(.black)
            .navigationBarTitle("Learning \(model.currentModule?.category ?? "")")
            
        }
        
    }
}
