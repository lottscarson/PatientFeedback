//
//  PatientFeedbackApp.swift
//  PatientFeedback
//
//  Created by Scott Larson on 5/6/24.
//

import SwiftUI

@main
struct PatientFeedbackApp: App {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .onOpenURL { url in
                    if self.viewModel.checkDeepLink(url: url) {
                         print("Arrived via Deeplink")
                     } else {
                         print("Womp womp, no Deeplink found ")
                     }
                 }
        }
        
    }
}
