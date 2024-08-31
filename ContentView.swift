//
//  ContentView.swift
//  Alarm-app
//
//  Created by Berke Kaçar on 31.08.2024.
//

import SwiftUI
import SwiftData


struct AlarmView: View {
    var body: some View {
        GeometryReader{ geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            NavigationStack{
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, world!")
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .background(Color(
                    red: 41/255, green: 42/255, blue: 47/255
                ))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            print("add")
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            print("edit bar")
                        }, label: {
                            Text("edit")
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    AlarmView()
        .modelContainer(for: Alarm.self, inMemory: true)
}
