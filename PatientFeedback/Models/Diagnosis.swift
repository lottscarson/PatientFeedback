//
//  Diagnosis.swift
//  PatientFeedback
//
//  Created by Scott Larson on 5/6/24.
//

import Foundation

struct Diagnosis: Decodable {
    enum OuterKeys: String, CodingKey {
        case code
    }
    
    enum CodeKeys: String, CodingKey {
        case coding
    }
   
    struct Coding: Decodable {
        enum CodingKeys: String, CodingKey {
            case name
        }
        
        let name: String
    }

    let description: String

    init(from decoder: Decoder) throws {
        let outerContainer = try decoder.container(keyedBy: OuterKeys.self)
        let codeContainer = try outerContainer.nestedContainer(keyedBy: CodeKeys.self,
                                                               forKey: .code)
        let codingArray = try codeContainer.decode([Coding].self,
                                                   forKey: .coding)
        guard let name = codingArray.first?.name else {
            throw DecodingError.dataCorruptedError(forKey: .coding, in: codeContainer, debugDescription: "Data Corrupted")
        }
        
        self.description = name
    }
}
