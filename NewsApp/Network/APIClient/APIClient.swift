//
//  APIClient.swift
//  NewsApp
//
//  Created by Jerin Emmanuel on 12/17/20.
//

import Foundation

public typealias ResultCallback<Value> = (Result<Value, Error>) -> Void

/// Implementation of a generic-based API client
public class APIClient {
    
    public static let shared = APIClient()
    
    private let session = URLSession(configuration: .default)
    
    /// Sends a request to server, calling the completion method when finished
    public func perform<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<T.SuccessResponseType>) {
        
        let urlRequest = request.urlRequest
        let task = session.dataTask(with: urlRequest) { data, response, error in
            
            if let err = error {
                completion(.failure(err))
                return
            }
            
            guard let data = data, data.count > 0 else {
                completion(.failure(APIError.noResponse))
                return
            }
            self.decode(request, data: data, completion: completion)
            
        }
        task.resume()
    }
    
    /// Decode data based on the given request
    private func decode<T: APIRequest>(_ request: T, data: Data, completion: @escaping ResultCallback<T.SuccessResponseType>) {
        completion(Result{
            try JSONDecoder()
                .decode(Response<T.SuccessResponseType>.self,
                        from: data) }
            .flatMap { (response) -> Result<T.SuccessResponseType, Error> in
                if let results = response.results {
                    return .success(results)
                }
                return .failure(APIError.noResults)
        })
    }
    
    public func cancel<T: APIRequest>(_ request: T) {
        URLSession.shared.getAllTasks { tasks in
            tasks
                .filter { $0.state == .running }
                .filter { $0.originalRequest == request.urlRequest }.first?
                .cancel()
        }
    }
}
