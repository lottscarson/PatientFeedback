//
//  Name.swift
//  PatientFeedback
//
//  Created by Scott Larson on 5/6/24.
//

import Foundation

struct Name: Decodable {
    enum OuterKeys: String, CodingKey {
        case name
    }
    
    enum NameKeys: String, CodingKey {
        case firstName = "first"
        case lastName = "last"
    }
    
    let firstName: String
    let lastName: String
    
    init(from decoder: Decoder) throws {
        let outerContainer = try decoder.container(keyedBy: OuterKeys.self)
        let nameContainer = try outerContainer.nestedContainer(keyedBy: NameKeys.self,
                                                               forKey: .name)
        
        self.firstName = try nameContainer.decode(String.self, forKey: .firstName)
        self.lastName = try nameContainer.decode(String.self, forKey: .lastName)
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}
