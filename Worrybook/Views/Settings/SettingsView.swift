//
//  SettingsView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct SettingsView: View {
    @Binding var show: Bool
    
    @State private var enableWorryTime = false
    @State private var worryTimeDescriptionAlert = false
    @State private var worryTime = Date()
    
    private let colorHelper = ColorHelper()

    var body: some View {
        VStack {
            HStack {
                Text("Schedule Worry Time")
                    .padding(10)
                Toggle(isOn: self.$enableWorryTime) {
                    Button(action: {
                        self.worryTimeDescriptionAlert.toggle()
                    }) {
                        VStack (alignment: HorizontalAlignment.center) {
                            Image(systemName: "info.circle")
                                .foregroundColor(.gray)
                                .imageScale(.small)
                        }
                    }
                    .alert(isPresented: self.$worryTimeDescriptionAlert) {
                        Alert(
                            title: Text("Schedule Worry Time"),
                            message: Text("Enabling this option will allow you to set a time to be notified daily to sit calmly and review your worry diary by practicing Worry Time."),
                            dismissButton: .default(Text("Got it!"))
                        )
                    }
                }
                .padding(10)
            }
        }
        
        if (self.enableWorryTime) {
            VStack {
                DatePicker("Worry Time", selection: $worryTime, displayedComponents: .hourAndMinute)
                    .padding(.leading, 50)
                    .padding(.top, 5)
                    .padding(.trailing, 50)
            }
        }
        
        Spacer()
        
        Button(action: {
            // Save setting
            // Set-up notifications
            // Close modal
            self.show.toggle()
        }) {
            HStack {
                Image(systemName: "checkmark")
                    .font(.title2)
                Text("Save")
                    .fontWeight(.semibold)
                    .font(.title2)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(10)
            .foregroundColor(.white)
            .background(colorHelper.primaryColor)
            .cornerRadius(50)
            .padding(10)
        }
    }
}
