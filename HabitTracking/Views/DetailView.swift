//
//  DetailView.swift
//  HabitTracking
//
//  Created by Izaan Saleem on 29/02/2024.
//

import SwiftUI

struct DetailView: View {
    
    @State var activities: Activities
    @State var activity: Activity
    
    var count: Int {
        if let actIndex = self.activities.activities.firstIndex(where: { ( $0.id == activity.id ) }) {
            return self.activities.activities[actIndex].completionCount
        } else {
            return 0
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.black, .gray], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    
                    Text(activity.activity)
                        .font(.title)
                        .fontWeight(.semibold)
                        .fontDesign(.monospaced)
                    
                    Divider()
                    
                    Text(activity.description)
                        .font(.headline)
                        .fontDesign(.monospaced)
                    
                    Spacer()
                    
                    Text("Performed: \(count)")
                        .font(.title)
                        .fontWeight(.bold)
                        .fontDesign(.monospaced)
                    
                    Button("Plus Completion Count") {
                        if let actIndex = self.activities.activities.firstIndex(where: { ( $0.id == activity.id ) }) {
                            let activity = Activity(id: activity.id, activity: activity.activity, description: activity.description, completionCount: count + 1)
                            self.activities.activities[actIndex] = activity
                        }
                    }
                    .padding()
                    .background(Color.gray.gradient)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 10))
                }
                .padding()
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    DetailView(activities: Activities(), activity: Activities().activities[0])
}
