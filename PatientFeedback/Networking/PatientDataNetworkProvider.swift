//
//  PatientDataNetworkProvider.swift
//  PatientFeedback
//
//  Created by Scott Larson on 5/6/24.
//

import Foundation
import Combine

protocol PatientDataNetworkProvider {
    func getPatientData(id: String) -> AnyPublisher<PatientData, Error>
}

class PatientDataNetworkClient: PatientDataNetworkProvider {
    var networkClient: NetworkProvider = NetworkClient.instance
    
    func getPatientData(id: String) -> AnyPublisher<PatientData, Error> {
        networkClient.request(APIRouter.patientData(id: id)).decode()
    }
}
