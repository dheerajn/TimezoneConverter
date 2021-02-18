//
//  NetworkService.swift
//  TimezoneConverter
//
//  Created by Dheeru Neelam on 2/17/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
    case delete = "DELETE"
    case put = "PUT"
}

final class NetworkService: NetworkCalls {
    private var request: URLRequest? {
        guard let validUrlString = urlString, let url = URL(string: validUrlString) else { return nil }
        var localRequest = URLRequest(url: url, timeoutInterval: Double.infinity)
        if let validParameters = parameters {
            localRequest.httpBody = try? JSONSerialization.data(withJSONObject: validParameters)
        }
        if let validHeaders = headers {
            validHeaders.forEach {
                localRequest.addValue($0.value, forHTTPHeaderField: $0.key)
            }
        }
        localRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        localRequest.httpMethod = httpMethod?.rawValue
        
        print("\n\nrequest is", localRequest, "\n\nhttpRequest:",  String(describing: httpMethod?.rawValue), "\n\nHeaders:", String(describing: headers), "\n\nparameters:", String(describing: parameters), "\n\n")
        return localRequest
    }
    
    private var urlString: String?
    private var httpMethod: HTTPMethod? = .get
    private var parameters: [String: Any]?
    private var headers: [String: String]?
    
    init(urlString: String, httpMethod: HTTPMethod? = .get, parameters: [String: Any]? = nil, headers: [String: String]? = nil) {
        self.urlString = urlString
        self.httpMethod = httpMethod
        self.parameters = parameters
        self.headers = headers
    }
}

extension NetworkService {
    @discardableResult
    func load<T: Decodable>() -> AnyPublisher<Result<T, NetworkError>, Never> {
        guard let request = request else {
            return .just(.failure(NetworkError.invalidRequest))
        }
        return URLSession.shared.dataTaskPublisher(for: request)
            .mapError { _ in
                return NetworkError.invalidRequest
            }
            .flatMap { data, response -> AnyPublisher<Data, NetworkError> in
                print("data is:", String(data: data, encoding: .utf8) ?? "No data is readableJ")
                guard let response = response as? HTTPURLResponse else {
                    return .fail(NetworkError.invalidResponse)
                }
                
                guard 200..<300 ~= response.statusCode else {
                    return .fail(NetworkError.dataLoadingError(statusCode: response.statusCode, data: data))
                }
                return .just(data)
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .map {
                .success($0)
            }
            .catch { error -> AnyPublisher<Result<T, NetworkError>, Never> in
                let formattedError = error as? NetworkError
                
                switch formattedError {
                case .dataLoadingError(let code, let data):
                    return .just(.failure(NetworkError.dataLoadingError(statusCode: code, data: data)))
                    
                case .invalidRequest:
                    return .just(.failure(NetworkError.invalidRequest))
                    
                case .invalidResponse:
                    return .just(.failure(NetworkError.invalidResponse))
                    
                case .jsonDecodingError(let error):
                    return .just(.failure(NetworkError.jsonDecodingError(error: error)))
                    
                case .invalidToken:
                    return .just(.failure(NetworkError.invalidToken))
                    
                case .none:
                    return .just(.failure(NetworkError.jsonDecodingError(error: error)))
                }
            }
            .eraseToAnyPublisher()
    }
}

