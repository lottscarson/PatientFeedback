//
//  PatientData.swift
//  PatientFeedback
//
//  Created by Scott Larson on 5/6/24.
//

import Foundation

struct PatientData: Decodable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id, diagnosis
        case patientName = "patient"
        case doctorName = "doctor"
    }
    
    let id: String
    let patientName: Name
    let doctorName: Name
    let diagnosis: Diagnosis
}
