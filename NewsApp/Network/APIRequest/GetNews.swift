//
//  GetNews.swift
//  NewsApp
//
//  Created by Jerin Emmanuel on 12/17/20.
//

import Foundation

struct GetNews: APIRequest {

    typealias SuccessResponseType = [News]

    var method: HTTPMethod { .get }

    var resourceName: String? { "\(section)/\(period).json" }
    
    var section: String
    
    var period: Int

}
