//
//  DoctorExplainView.swift
//  PatientFeedback
//
//  Created by Scott Larson on 5/6/24.
//

import SwiftUI

struct DoctorExplainView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @State private var drExplained: Bool?
    @State private var thoughts: String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            let diagnosis = viewModel.patientData?.diagnosis.description ?? "a horrible curse"
            let drName = viewModel.patientData?.doctorName.lastName ?? ""
            
            Text("Thank you. You were diagnosed with \(diagnosis). Did Dr. \(drName) explain how to manage this diagnosis in a way you could understand?")
                .leadingAlignment()
                .foregroundColor(.primary)
                .padding(10)
            
            HStack(spacing: 10) {
                Button(action: {
                    self.drExplained = true
                    self.viewModel.setDoctorExplained(explained: true)
                }) {
                    Text("Yes")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor((self.drExplained != nil && self.drExplained == true) ? .white : .pink)
                        .background((self.drExplained != nil && self.drExplained == true) ? .pink : .white)
                        .border(.pink)
                }
                Button(action: {
                    self.drExplained = false
                    self.viewModel.setDoctorExplained(explained: false)
                }) {
                    Text("No")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor((self.drExplained != nil && self.drExplained == false) ? .white : .pink)
                        .background((self.drExplained != nil && self.drExplained == false) ? .pink : .white)
                        .border(.pink)
                }
            }
            .padding(5)
            
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
                    self.viewModel.setDoctorThoughts(thoughts: newValue)
                }
            
            if self.drExplained != nil {
                NavigationLink(destination: DiagnosisThoughtsView()) {
                    Text("Next")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.pink)
                }
                .padding(20)
            }
            
            Spacer()
        }
        .navigationBarTitle("Feedback", displayMode: .inline)
    }
}
