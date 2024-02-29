//
//  ContentView.swift
//  HabitTracking
//
//  Created by Izaan Saleem on 27/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var activities = Activities()
    @State private var showAddSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                LinearGradient(colors: [.black, .gray], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                List() {
                    ForEach(activities.activities) { activity in
                        NavigationLink {
                            DetailView(activities: activities, activity: activity)
                        } label: {
                            Text(activity.activity)
                                .foregroundStyle(.white)
                                .font(.title3)
                                .fontDesign(.rounded)
                                .padding()
                        }
                    }
                    .onDelete(perform: { indexSet in
                        self.removeRow(at: indexSet)
                    })
                    .listRowBackground(Color.clear)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Habit Tracking")
            .toolbar {
                EditButton()
                    .foregroundStyle(.white)
                Button("Add") {
                    self.showAddSheet = true
                }
                .foregroundStyle(.white)
            }
            .toolbarColorScheme(.dark)
            .preferredColorScheme(.dark)
            
        }
        .sheet(isPresented: $showAddSheet, content: {
            AddView(activities: activities)
        })
    }
    
    private func removeRow(at offset: IndexSet) {
        activities.activities.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
