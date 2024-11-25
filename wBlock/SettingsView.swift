//
//  SettingsView.swift
//  wBlock
//
//  Created by Alexander Skula on 11/25/24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("updateInterval") private var updateInterval: TimeInterval = 86400 // Default to 24 hours
    @Environment(\.presentationMode) var presentationMode

    let intervalOptions: [(name: String, value: TimeInterval)] = [
        ("1 Hour", 3600),
        ("24 Hours", 86400),
        ("7 Days", 604800),
        ("14 Days", 1209600),
        ("30 Days", 2592000)
    ]

    var body: some View {
        VStack(spacing: 15) {
            // Header
            Text("Settings")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 10)

            Divider()

            // Update Interval Dropdown
            VStack(alignment: .leading, spacing: 8) {

                Picker("Check for updates every:", selection: $updateInterval) {
                    ForEach(intervalOptions, id: \.value) { option in
                        Text(option.name).tag(option.value)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 20)

            Spacer()

            // Close Button
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Close")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: 200) // Set a suitable max width
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.bottom, 15)
            .frame(maxWidth: .infinity) // Center the button horizontally
        }
        .frame(width: 400, height: 250)
        .padding()
    }
}
