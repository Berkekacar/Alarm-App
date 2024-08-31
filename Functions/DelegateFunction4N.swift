//
//  DelegateFunction4N.swift
//  Alarm-app
//
//  Created by Berke Kaçar on 1.09.2024.
//

import Foundation
import UserNotifications

func requestNotificationPermission() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
        if granted {
            print("Bildirim izni verildi.")
        } else {
            print("Bildirim izni reddedildi.")
        }
    }
}

