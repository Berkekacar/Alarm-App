//
//  DayPickerView.swift
//  Alarm-app
//
//  Created by Berke Kaçar on 31.08.2024.
//

import SwiftUI

struct DayPickerView: View {
    let daysOfWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    @Binding var selectedDays: Set<String>
    var body: some View {
        VStack{
            List(daysOfWeek, id: \.self) { day in
                HStack {
                    Text(day)
                    Spacer()
                    // Toggle ile günlerin seçimini kontrol et
                    Toggle(isOn: Binding(
                        get: { self.selectedDays.contains(day) },
                        set: { isSelected in
                            if isSelected {
                                self.selectedDays.insert(day)
                            } else {
                                self.selectedDays.remove(day)
                            }
                        }
                    )) {
                        Text("")
                    }
                    .labelsHidden()
                }
            }
            .listStyle(.plain)
        }
    }
}

