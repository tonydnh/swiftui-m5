//
//  HomeView.swift
//  LearningApp
//
//  Created by Tony Dinh on 6/27/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                
                Text("What do you want to do today?")
                    .padding(.leading, 20)
                
                ScrollView {
                    
                    LazyVStack {
                        
                        ForEach(model.modules) { module in
                            
                            VStack(spacing: 20) {
                                
                                NavigationLink(tag: module.id, selection: $model.currentContentSelected) {
                                    
                                    ContentView()
                                        .onAppear {
                                            model.beginModule(module.id)
                                        }
                                    
                                } label: {
                                    // MARK: Learning Card
                                    HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                }
                                
                                NavigationLink(tag: module.id, selection: $model.currentTestSelected) {
                                    
                                    TestView()
                                        .onAppear {
                                            model.beginTest(module.id)
                                        }
                                    
                                } label: {
                                    // MARK: Test Card
                                    HomeViewRow(image: module.test.image, title: " \(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Lessons", time: module.test.time)
                                }
                                
                                
                            }
                            .padding(.bottom, 10)

                        }
                        
                    }
                    .foregroundColor(.black)
                    .padding()
                    
                }
            }
            .navigationTitle("Get Started")
            .onChange(of: model.currentContentSelected) { changedValue in
                if changedValue == nil {
                    model.currentModule = nil
                }
            }
            .onChange(of: model.currentTestSelected) { changedValue in
                if changedValue == nil {
                    model.currentTestSelected = nil
                }
            }
        }
        .navigationViewStyle(.stack)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
