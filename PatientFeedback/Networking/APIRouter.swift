//
//  APIRouter.swift
//  PatientFeedback
//
//  Created by Scott Larson on 5/6/24.
//

import Foundation

enum APIRouter: RequestInfoConvertible {
    case patientData(id: String)

    var endpoint: String {
        "https://api.patientdata.com"
    }
    
    var urlString: String {
        "\(endpoint)/\(path)"
    }
    
    var path: String {
        switch self {
        case .patientData(let id):
            return "patientdata/\(id)"
        }
    }
    
    func asRequestInfo() -> RequestInfo {
        let requestInfo: RequestInfo = RequestInfo(url: urlString)
        return requestInfo
    }
}
