//
//  NetworkError.swift
//  WeatherApp
//
//  Created by Vinoth Priyan on 22/10/22.
//

import Foundation
import Combine

enum NetworkError: Error{
    
    case invalidURL
    case networkError
    case networkFailed
}

extension NetworkError: LocalizedError{
    var localizedDesc: String? {
        switch self{
            
        case .invalidURL:
            return NSLocalizedString("URL Invalid", comment: "URL Type Invalid ")
        case .networkError:
            return NSLocalizedString("Network Error Accured", comment: "Network Error Accured")
        case .networkFailed:
            return NSLocalizedString("Network Failed", comment: "Network Failed")
        }
    }
}
