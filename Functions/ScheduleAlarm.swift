//
//  ScheduleAlarm.swift
//  Alarm-app
//
//  Created by Berke Kaçar on 1.09.2024.
//

import Foundation
import UserNotifications
import AVFoundation

func scheduleAlarmNotification(alarm: Alarm) {
    let content = UNMutableNotificationContent()
    content.title = alarm.label
    content.body = "It's time for your alarm!"
    content.sound = UNNotificationSound.default

    var dateComponents = Calendar.current.dateComponents([.hour, .minute], from: alarm.timestamp)
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: alarm.repeatDays.count > 0)

    let request = UNNotificationRequest(identifier: alarm.id.uuidString, content: content, trigger: trigger)

    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Error scheduling notification: \(error)")
        } else {
            print("Notification scheduled for \(alarm.timestamp)")
        }
    }
}


