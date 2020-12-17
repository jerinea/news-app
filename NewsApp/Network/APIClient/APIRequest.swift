//
//  APIRequest.swift
//  NewsApp
//
//  Created by Jerin Emmanuel on 12/17/20.
//

import Foundation

// All requests must conform to this protocol
public protocol APIRequest {
    // Type to decode incoming json
    associatedtype SuccessResponseType: Decodable
    
    // Api http method
    var method: HTTPMethod { get }
    
    //  Endpoint for this request (the last part of the URL)
    var resourceName: String? { get }

    // Base URL
    var baseEndpointUrl: URL { get }
    
}

extension APIRequest {
    
    public var baseEndpointUrl: URL {
        return URL(string: Environment.apiBase)!
    }

    var urlRequest: URLRequest {
        let endpoint = self.endpoint()
        var urlRequest = URLRequest(url: endpoint)
        urlRequest.httpMethod = self.method.rawValue
        return urlRequest
    }
    
    // Encodes a URL based on the given request
    private func endpoint() -> URL {
        
        var baseUrl = baseEndpointUrl
        if let path = self.resourceName {
            baseUrl = baseUrl.appendingPathComponent(path)
        }
        
        var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)!
        
        // Common query items needed for all requests
        var commonQueryItems = [URLQueryItem]()

        // If any common query mention here
        commonQueryItems.append(URLQueryItem(name: "api-key", value: Environment.apiKey))
        
        components.queryItems = commonQueryItems
        
        // Construct the final URL with all the previous data
        return components.url!
    }
}
