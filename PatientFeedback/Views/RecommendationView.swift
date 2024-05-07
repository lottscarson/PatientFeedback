//
//  RecommendationView.swift
//  PatientFeedback
//
//  Created by Scott Larson on 5/6/24.
//

import SwiftUI

struct RecommendationView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @State var selected: Int = 0
    
    var body: some View {

        VStack(spacing: 10) {
            let patientName = viewModel.patientData?.patientName.firstName ?? ""
            let drName = viewModel.patientData?.doctorName.lastName ?? ""
            
            Text("Hi \(patientName), on a scale from 1-10, would you recommend Dr. \(drName) to a friend or family member?")
                .leadingAlignment()
                .foregroundColor(.primary)
                .padding(10)
            Text("1 = Would not recommend, 10 = Would strongly recommend")
                .leadingAlignment()
                .foregroundColor(.primary)
                .padding(10)
            
            // Rating Buttons
            HStack(spacing: 10) {
                ForEach((1...5), id: \.self) { i in
                    Button(action: {
                        self.selected = i
                        self.viewModel.setRating(rating: i)
                    }) {
                        Text("\(i)")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(i == self.selected ? .white : .pink)
                            .background(i == self.selected ? .pink : .white)
                            .border(.pink)
                    }
                }
            }
            .padding(5)
            HStack(spacing: 10) {
                ForEach((6...10), id: \.self) { i in
                    Button(action: {
                        self.selected = i
                        self.viewModel.setRating(rating: i)
                    }) {
                        Text("\(i)")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(i == self.selected ? .white : .pink)
                            .background(i == self.selected ? .pink : .white)
                            .border(.pink)
                    }
                }
            }
            .padding(5)
                
            if self.selected > 0 {
                NavigationLink(destination: DoctorExplainView()) {
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
