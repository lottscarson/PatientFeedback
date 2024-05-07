//
//  DiagnosisThoughtsView.swift
//  PatientFeedback
//
//  Created by Scott Larson on 5/7/24.
//

import SwiftUI

struct DiagnosisThoughtsView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @State private var thoughts: String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            let diagnosis = viewModel.patientData?.diagnosis.description ?? "a horrible curse"
            Text("We appreciate the feedback. One last question: how do you feel about being diagnosed with \(diagnosis)?")
                .leadingAlignment()
                .foregroundColor(.primary)
                .padding(10)
            
            Text("Your thoughts:")
                .leadingAlignment()
                .foregroundColor(.primary)
                .padding(10)
            
            TextField("Thoughts", text: $thoughts, axis: .vertical)
                .padding()
                .keyboardType(.asciiCapable)
                .lineLimit(5, reservesSpace: true)
                .textFieldStyle(.roundedBorder)
                .onChange(of: thoughts) { newValue in
                    self.viewModel.setDiagnosisThoughts(thoughts: newValue)
                }
            
            NavigationLink(destination: ResponsesView()) {
                Text("Next")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(.pink)
            }
            .padding(20)
            
            Spacer()
        }
        .navigationBarTitle("Feedback", displayMode: .inline)
    }
}

