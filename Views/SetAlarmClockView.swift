//
//  SetAlarmClockView.swift
//  Alarm-app
//
//  Created by Berke Kaçar on 31.08.2024.
//

import SwiftUI

struct SetAlarmClockView: View {
    @State private var selectedTime = Date()
    @State private var selectedDays: Set<String> = []
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) var pm
    @State private var isSetAlarm = false
    var body: some View {
        GeometryReader{ geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            VStack{
                CustomTimePickerView(selectedTime: $selectedTime)
                    .frame(maxWidth: .infinity, maxHeight: height * 0.3)
                DayPickerView(selectedDays: $selectedDays)
                    .frame(height: height * 0.50)
                    .padding(.bottom, 10)
                Button(action: {
                    saveAlerm()
                    pm.wrappedValue.dismiss()
                    print("Seçilen Saat: \(formattedTime)")
                    print(selectedDays.joined(separator: "."))
                }, label: {
                    Text("Button")
                })
                .padding(.top, 10)
            }
            .padding()
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .ignoresSafeArea()
            .background(Color(
                red: 41/255, green: 42/255, blue: 47/255
            ))
        }
    }
    public var formattedTime: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateToDisplay = selectedTime ?? Date()
        return formatter.string(from: dateToDisplay)
    }
    private func saveAlerm() {
        let alarm = Alarm(
            timestamp: selectedTime,
            repeatDays: Array(selectedDays)
        )
        modelContext.insert(alarm)

        scheduleAlarmNotification(alarm: alarm)

        print("Alarm set for \(formattedTime) on days: \(selectedDays.joined(separator: ", "))")
    }
}

#Preview {
    SetAlarmClockView()
}
