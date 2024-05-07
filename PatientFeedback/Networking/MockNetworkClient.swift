//
//  MockNetworkClient.swift
//  PatientFeedback
//
//  Created by Scott Larson on 5/6/24.
//

import Foundation
import Combine

class MockNetworkClient: NetworkProvider {
    var response: (Data?, Error?) = (nil, NetworkError.invalidResponse)
    
    init(response: (Data?, Error?)) {
        self.response = response
    }
    
    func request(_ info: RequestInfoConvertible) -> AnyPublisher<Data, Error> {
        if let error = response.1 {
            return Fail(error: error)
                .eraseToAnyPublisher()
        } else if let data = response.0 {
            return Just(data)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } else {
            return Fail(error: NetworkError.invalidResponse)
                .eraseToAnyPublisher()
        }
    }
}

class MockUtils {
    static func loadData(file: String) -> Data? {
        guard let url = Bundle(for: Self.self).url(forResource: file, withExtension: nil), let data = try? Data(contentsOf: url) else { return nil }
        return data
    }
    
    static func mockNetworkClient(file: String) -> MockNetworkClient {
        let data = loadData(file: file)
        return MockNetworkClient(response: (data, nil))
    }
}
