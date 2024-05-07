//
//  PatientFeedbackTests.swift
//  PatientFeedbackTests
//
//  Created by Scott Larson on 5/6/24.
//

import XCTest
import Combine
@testable import PatientFeedback


final class PatientFeedbackTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPatientDataNetworkProviderGetPatientData() {
        let exp = expectation(description: "Parse patient data success")
        var subscriptions = Set<AnyCancellable>()
        
        let expId = "0c3151bd-1cbf-4d64-b04d-cd9187a4c6e0"
        let expPatientFirst = "Tendo"
        let expPatientLast = "Tenderson"
        let expDoctorFirst = "John"
        let expDoctorLast = "Doe"
        let expDiagnosis = "Diabetes without complications"
        
        let networkClient = MockUtils.mockNetworkClient(file: "patient-data.json")
        let patientDataNetworkClient = PatientDataNetworkClient()
        patientDataNetworkClient.networkClient = networkClient
        
        patientDataNetworkClient.getPatientData(id: expId ).sink { _ in } receiveValue: { patientData in
            let isCorrectParsing = (patientData.id == expId &&
                                    patientData.patientName.firstName == expPatientFirst &&
                                    patientData.patientName.lastName == expPatientLast &&
                                    patientData.doctorName.firstName == expDoctorFirst &&
                                    patientData.doctorName.lastName == expDoctorLast &&
                                    patientData.diagnosis.description == expDiagnosis)
            
            XCTAssert(isCorrectParsing)
            
            exp.fulfill()
        }.store(in: &subscriptions)

        wait(for: [exp], timeout: 1)
    }

}
