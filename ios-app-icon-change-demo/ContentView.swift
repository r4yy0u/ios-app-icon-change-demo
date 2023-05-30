//
//  ContentView.swift
//  ios-app-icon-change-demo
//
//  Created by yourui on 2023/5/26.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack(spacing: 50.0) {
            Button("Change app icon to DEV") {
                changeIcon(to: "dev")
            }
            Button("Change app icon to IN") {
                changeIcon(to: "in")
            }
            Button("Change app icon to QA") {
                changeIcon(to: "qa")
            }
            Button("Change app icon to Simba") {
                changeIcon(to: "simba")
            }
            Button("Change app icon to the original one") {
                changeIcon(to: nil)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class ViewModel: ObservableObject {
    init() {
        print("Model code executed")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            changeIcon(to: "simba")
        }
    }
}

func changeIcon(to iconName: String?) {
    guard UIApplication.shared.supportsAlternateIcons else {
        print("This version of iOS system does not support changing app icon.")
        return
    }
    UIApplication.shared.setAlternateIconName(iconName, completionHandler: { error in
        if let error = error {
            print("App icon failed to change due to \(error.localizedDescription)")
        } else {
            print("App icon changed successfully to \(iconName ?? "the original one")")
        }
    })
}
