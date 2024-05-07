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
    
    func getPatientData(id: String = "") {
        let networkClient = MockUtils.mockNetworkClient(file: "patient-data.json")
        let patientDataNetworkClient = PatientDataNetworkClient()
        patientDataNetworkClient.networkClient = networkClient
        
        patientDataNetworkClient.getPatientData(id: id)
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
    
    func checkDeepLink(url: URL) -> Bool {
        guard let deepLinkComponent = URLComponents(url: url, resolvingAgainstBaseURL: true)?.host else {
            return false
        }
        
        print(deepLinkComponent)
        return self.checkInternalDeepLinks(component: deepLinkComponent)
    }
    
    func checkInternalDeepLinks(component: String) -> Bool {
        self.getPatientData(id: component)
        let data = self.patientData
        
        return data != nil
    }
}
