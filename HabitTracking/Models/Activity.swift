//
//  Activity.swift
//  HabitTracking
//
//  Created by Izaan Saleem on 27/02/2024.
//

import Foundation

class Activity: Identifiable, Codable {
    var id = UUID()
    var activity: String
    var description: String
    var completionCount: Int
    
    init(id: UUID = UUID(), activity: String, description: String, completionCount: Int) {
        self.id = id
        self.activity = activity
        self.description = description
        self.completionCount = completionCount
    }
}

@Observable class Activities {
    init() {
        if let savedActivities = UserDefaults.standard.data(forKey: "activities") {
            if let decodedTypes = try? JSONDecoder().decode([Activity].self, from: savedActivities) {
                activities = decodedTypes
            }
        }
    }
    
    var activities: [Activity] = [] {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "activities")
            }
        }
    }
}
