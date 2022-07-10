//
//  ResumeView.swift
//  LearningApp
//
//  Created by Tony Dinh on 7/9/22.
//

import SwiftUI

struct ResumeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var resumeSelected: Int?
    
    let user = UserService.shared.user
    
    var resumeTitle: String {
        let module = model.modules[user.lastModule ?? 0]
        
        if user.lastLesson != 0 {
            // Resume a lesson
            return "Learn \(module.category): Lesson \(user.lastLesson! + 1)"
        }
        else {
            // Resume a test
            return "\(module.category) Test: Question \(user.lastQuestion! + 1)"
        }
    }
    
    var destination: some View {
        return Group {
            let module = model.modules[user.lastModule ?? 0]
            
            // Determine if we need to go into a ContentDetailView or a TestView
            if user.lastLesson! > 0 {
                // Go to ContentDetailView
                ContentDetailView()
                    .onAppear {
                        // Fetch lessons
                        model.getLessons(module: module) {
                            model.beginModule(module.id)
                            model.beginLesson(user.lastLesson!)
                        }
                    }
            }
            else {
                // Go to TestView
                TestView()
                    .onAppear {
                        model.getQuestions(module: module) {
                            model.beginTest(module.id)
                            model.currentQuestionIndex = user.lastQuestion!
                        }
                    }
            }
        }
    }
    
    var body: some View {
        
        let module = model.modules[user.lastModule ?? 0]
        
        NavigationLink(destination: destination, tag: module.id.hash, selection: $resumeSelected) {
            ZStack {
                RectangleCard(color: .white)
                    .frame(height: 66)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Continue where you left off:")
                        Text(resumeTitle)
                            .bold()
                    }
                    Spacer()
                    Image("play")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                }
                .padding()
                
            }
        }
        .foregroundColor(.black)
        
    }
}

struct ResumeView_Previews: PreviewProvider {
    static var previews: some View {
        ResumeView()
    }
}
