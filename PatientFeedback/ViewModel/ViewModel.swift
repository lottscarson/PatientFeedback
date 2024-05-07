//
//  ViewModel.swift
//  PatientFeedback
//
//  Created by Scott Larson on 5/6/24.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var patientData: PatientData?
    private var feedback = Feedback()
    
    func getPatientData() {
        let networkClient = MockUtils.mockNetworkClient(file: "patient-data.json")
        let patientDataNetworkClient = PatientDataNetworkClient()
        patientDataNetworkClient.networkClient = networkClient
        
        patientDataNetworkClient.getPatientData(id: "")
            .map({ Optional.some($0) })
            .replaceError(with: nil)
            .assign(to: &$patientData)
    }
    
    func setRating(rating: Int) {
        self.feedback.rating = rating
    }
    
    func getRating() -> Int {
        return self.feedback.rating
    }
    
    func setDoctorExplained(explained: Bool) {
        self.feedback.doctorExplained = explained
    }
    
    func getDoctorExplained() -> Bool {
        return self.feedback.doctorExplained
    }
    
    func setDoctorThoughts(thoughts: String) {
        self.feedback.doctorThoughts = thoughts
    }
    
    func getDoctorThoughts() -> String {
        return self.feedback.doctorThoughts
    }
    
    func setDiagnosisThoughts(thoughts: String) {
        self.feedback.diagnosisThoughts = thoughts
    }
    
    func getDiagnosisThoughts() -> String {
        return self.feedback.diagnosisThoughts
    }
}
