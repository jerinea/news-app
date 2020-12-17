//
//  APIError.swift
//  NewsApp
//
//  Created by Jerin Emmanuel on 12/17/20.
//

import Foundation

public enum APIError: Error {
    case noResults
    case noResponse
}

extension APIError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .noResults:
            return "No results from api"
        case .noResponse:
            return "No response from api"
        }
    }
}
