//
//  AddView.swift
//  HabitTracking
//
//  Created by Izaan Saleem on 27/02/2024.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var activityName: String = ""
    @State private var description: String = ""
    
    @State var activities: Activities
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.black, .gray], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                List {
                    VStack(content: {
                        VStack {
                            Text("Activity")
                                .font(.title2)
                            TextField("Type here...", text: $activityName)
                                .padding()
                                .border(.gray)
                        }
                        .padding()
                        
                        VStack {
                            Text("Description")
                                .font(.title2)
                            TextField("Type here...", text: $description,  axis: .vertical)
                                .lineLimit(5...10)
                                .padding()
                                .border(.gray)
                        }
                        .padding()
                    })
                    .listRowBackground(Color.clear)
                }
                .listRowSeparator(.hidden)
                .listStyle(.plain)
                .navigationTitle("Add Activity").navigationBarTitleDisplayMode(.inline)
            }
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let activity = Activity(activity: activityName, description: description, completionCount: 0)
                        self.activities.activities.insert(activity, at: 0)
                        
                        self.dismiss()
                    }
                    .foregroundStyle(.white)
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        self.dismiss()
                    }
                    .foregroundStyle(.red)
                }
            }
        }
    }
}

#Preview {
    AddView(activities: Activities())
}
