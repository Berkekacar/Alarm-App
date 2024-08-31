//
//  Item.swift
//  Alarm-app
//
//  Created by Berke Kaçar on 31.08.2024.
//


import SwiftData
import Foundation

@Model
final class Alarm {
    @Attribute(.unique) var id: UUID
    var timestamp: Date
    var isActive: Bool
    var label: String
    var repeatDays: [String] // Haftanın günlerini temsil eden dizi (örneğin, ["Monday", "Wednesday"])
    var soundName: String
    var isSnoozeEnabled: Bool
    
    init(timestamp: Date, isActive: Bool = true, label: String = "Alarm", repeatDays: [String] = [], soundName: String = "Default", isSnoozeEnabled: Bool = true) {
        self.id = UUID()  // Her alarm için benzersiz bir kimlik
        self.timestamp = timestamp
        self.isActive = isActive
        self.label = label
        self.repeatDays = repeatDays
        self.soundName = soundName
        self.isSnoozeEnabled = isSnoozeEnabled
    }
}
