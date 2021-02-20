//
//  NetworkCalls.swift
//  TimezoneConverter
//
//  Created by Dheeru Neelam on 2/17/21.
//  Copyright © 2021 SwiftUIJam. All rights reserved.
//

import Foundation
import Combine

typealias TimezoneResult = Result<TimezoneModel, StandardError>
typealias TimezoneConversionResult = Result<TimezoneConversionModel, StandardError>

protocol NetworkCalls {
    func getTimezones(currentTime: String) -> AnyPublisher<TimezoneResult, Never>
    func getTimezones(location: Location) -> AnyPublisher<TimezoneResult, Never>
    func convertTimezones(baseLocation: Location, baseDatetime: Date, targetLocation: Location) -> AnyPublisher<TimezoneConversionResult, Never>
}

extension NetworkCalls {
    
    func getTimezones(currentTime: String) -> AnyPublisher<TimezoneResult, Never> {
        let parameters = [
            "currentTime" : currentTime
        ]
        let timezoneUrlString = "http://...timezone"
        
        return NetworkService(urlString: timezoneUrlString, httpMethod: .post, parameters: parameters).load()
            .map { (result: Result<TimezoneModel, NetworkError>) -> TimezoneResult in
                switch result {
                case .success(let value):
                    return .success(value)
                case .failure(let error):
                    switch error {
                    case .dataLoadingError(_, let data):
                        let err = try? JSONDecoder().decode(StandardError.self, from: data)
                        return .failure(err ?? StandardError.defaultValueWithValidToken)
                        
                    case .invalidToken:
                        return .failure(StandardError.defaultValueWithInValidToken)
                        
                    default:
                        return .failure(StandardError.defaultValueWithValidToken)
                    }
                }
            }
            .subscribe(on: RunLoop.backgroundWorkScheduler)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func getTimezones(location: Location) -> AnyPublisher<TimezoneResult, Never> {
        
        let parameters: [String: Any]? = nil
        
        var timezoneUrlString = URLComponents(string: "https://timezone.abstractapi.com/v1/current_time")!

        timezoneUrlString.queryItems = [
            URLQueryItem(name: "api_key", value: "529f043d73d444649caa77483b0bfd52"),
            URLQueryItem(name: "location", value: location.description())
        ]
        
        
        return NetworkService(urlString: timezoneUrlString.string!, httpMethod: .get, parameters: parameters).load()
            .map { (result: Result<TimezoneModel, NetworkError>) -> TimezoneResult in
                switch result {
                case .success(let value):
                    return .success(value)
                case .failure(let error):
                    switch error {
                    case .dataLoadingError(_, let data):
                        let err = try? JSONDecoder().decode(StandardError.self, from: data)
                        return .failure(err ?? StandardError.defaultValueWithValidToken)
                        
                    case .invalidToken:
                        return .failure(StandardError.defaultValueWithInValidToken)
                        
                    default:
                        return .failure(StandardError.defaultValueWithValidToken)
                    }
                }
            }
            .subscribe(on: RunLoop.backgroundWorkScheduler)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func convertTimezones(baseLocation: Location, baseDatetime: Date, targetLocation: Location) -> AnyPublisher<TimezoneConversionResult, Never> {
        let parameters: [String: Any]? = nil
        
        var timezoneUrlString = URLComponents(string: "https://timezone.abstractapi.com/v1/convert_time")!
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd-HH:mm:ss"

        timezoneUrlString.queryItems = [
            URLQueryItem(name: "api_key", value: "529f043d73d444649caa77483b0bfd52"),
            URLQueryItem(name: "base_location", value: baseLocation.description()),
            URLQueryItem(name: "base_datetime", value: formatter.string(from: baseDatetime)),
            URLQueryItem(name: "target_location", value: targetLocation.description())
        ]
        
        
        return NetworkService(urlString: timezoneUrlString.string!, httpMethod: .get, parameters: parameters).load()
            .map { (result: Result<TimezoneConversionModel, NetworkError>) -> TimezoneConversionResult in
                switch result {
                case .success(let value):
                    return .success(value)
                case .failure(let error):
                    switch error {
                    case .dataLoadingError(_, let data):
                        let err = try? JSONDecoder().decode(StandardError.self, from: data)
                        return .failure(err ?? StandardError.defaultValueWithValidToken)
                        
                    case .invalidToken:
                        return .failure(StandardError.defaultValueWithInValidToken)
                        
                    default:
                        return .failure(StandardError.defaultValueWithValidToken)
                    }
                }
            }
            .subscribe(on: RunLoop.backgroundWorkScheduler)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

extension NetworkCalls {
    private var getAuthorizationToken: [String: String] {
        let token = "Bearer " + "token will go here"
        return ["Authorization": token]
    }
}

