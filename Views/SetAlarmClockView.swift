//
//  SetAlarmClockView.swift
//  Alarm-app
//
//  Created by Berke Kaçar on 31.08.2024.
//

import SwiftUI

struct SetAlarmClockView: View {
    @State private var selectedTime = Date()
    @State private var isSetAlarm = false
    var body: some View {
        GeometryReader{ geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            VStack{
                CustomTimePickerView(selectedTime: $selectedTime)
                    .frame(maxWidth: .infinity, maxHeight: height * 0.3)
                Text("Seçilen Saat: \(formattedTime)")
                    .font(.headline)
                    .padding()
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
}

#Preview {
    SetAlarmClockView()
}
