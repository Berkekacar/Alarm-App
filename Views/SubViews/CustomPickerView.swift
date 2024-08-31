//
//  CustomPickerView.swift
//  Alarm-app
//
//  Created by Berke Kaçar on 31.08.2024.
//

import SwiftUI

struct CustomTimePickerView: View {
    @Binding var selectedTime: Date
    
    @State private var selectedHour = 0
    @State private var selectedMinute = 0

    let hours = Array(0..<24)
    let minutes = Array(0..<60)

    var body: some View {
        HStack {
            Picker(selection: $selectedHour, label: Text("Saat")) {
                ForEach(hours, id: \.self) { hour in
                    Text("\(hour)").foregroundColor(.yellow).tag(hour)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 100)
            .onChange(of: selectedHour) { _ in
                updateSelectedTime()
            }
            
            Text(":")
                .font(.largeTitle)
                .foregroundColor(.yellow)
            
            Picker(selection: $selectedMinute, label: Text("Dakika")) {
                ForEach(minutes, id: \.self) { minute in
                    Text(String(format: "%02d", minute))
                        .foregroundColor(.yellow)
                        .tag(minute)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 100)
            .onChange(of: selectedMinute) { _ in
                updateSelectedTime()
            }
        }
        .onAppear {
            let calendar = Calendar.current
            selectedHour = calendar.component(.hour, from: selectedTime)
            selectedMinute = calendar.component(.minute, from: selectedTime)
        }
    }
    
    private func updateSelectedTime() {
        let calendar = Calendar.current
        selectedTime = calendar.date(bySettingHour: selectedHour, minute: selectedMinute, second: 0, of: selectedTime) ?? selectedTime
    }
}
