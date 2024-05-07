//
//  ContentView.swift
//  PatientFeedback
//
//  Created by Scott Larson on 5/6/24.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            RecommendationView()
        }
        .onAppear {
            viewModel.getPatientData()
        }


    }
}
