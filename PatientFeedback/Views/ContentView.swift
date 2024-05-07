//
//  ContentView.swift
//  PatientFeedback
//
//  Created by Scott Larson on 5/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            RecommendationView()
        }
        .environmentObject(viewModel)
    }
}
