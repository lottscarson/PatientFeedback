//
//  ResponsesView.swift
//  PatientFeedback
//
//  Created by Scott Larson on 5/7/24.
//

import SwiftUI

struct ResponsesView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            let patientName = viewModel.patientData?.patientName.firstName ?? ""
            let drName = viewModel.patientData?.doctorName.lastName ?? ""
            let diagnosis = viewModel.patientData?.diagnosis.description ?? "a horrible curse"
            let rating = viewModel.getRating()
            let doctorExplained = viewModel.getDoctorExplained()
            let doctorThoughts = viewModel.getDoctorThoughts()
            let diagnosisThoughts = viewModel.getDiagnosisThoughts()
            
            Text("Thanks again! Here's what we heard:")
                .leadingAlignment()
                .foregroundColor(.primary)
                .padding(10)
                .bold()
            
            Text("Hi \(patientName), on a scale from 1-10, would you recommend Dr. \(drName) to a friend or family member?")
                .leadingAlignment()
                .foregroundColor(.primary)
                .padding(5)
            Text("You Said: \(rating)")
                .leadingAlignment()
                .foregroundColor(.primary)
                .bold()
                .padding(5)
            
            Divider()
                .padding(10)

            Text("Thank you. You were diagnosed with \(diagnosis). Did Dr. \(drName) explain how to manage this diagnosis in a way you could understand?")
                .leadingAlignment()
                .foregroundColor(.primary)
                .padding(5)
            Text("You Said: " + (doctorExplained ? "Yes" : "No") + ", \(doctorThoughts)")
                .leadingAlignment()
                .foregroundColor(.primary)
                .bold()
                .padding(5)

            Divider()
                .padding(10)

            Text("We appreciate the feedback. One last question: how do you feel about being diagnosed with \(diagnosis)?")
                .leadingAlignment()
                .foregroundColor(.primary)
                .padding(5)
            Text("You Said: \(diagnosisThoughts)")
                .leadingAlignment()
                .foregroundColor(.primary)
                .bold()
                .padding(5)

            Spacer()
        }
        .navigationBarTitle("Your Responses", displayMode: .inline)
    }
}
