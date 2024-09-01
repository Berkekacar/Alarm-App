//
//  ListAlarmsView.swift
//  Alarm-app
//
//  Created by Berke Kaçar on 1.09.2024.
//

import SwiftUI
import SwiftData

struct ListAlarmsView: View {
    @Query var alarms: [Alarm]
    @Environment(\.modelContext) private var modelContext
    var body: some View {
        List(alarms){ alarm in
            HStack{
                Text(alarm.label)
                Spacer()
                Toggle(isOn: Binding(
                    get: {alarm.isActive},
                    set: { newValue in
                        alarm.isActive = newValue
                        do {
                            try modelContext.save()
                        }catch{
                            print("error")
                        }
                    }
                )){
                    Text("Enabled")
                }
            }
        }.listStyle(.plain)
    }
}

#Preview {
    ListAlarmsView()
}
