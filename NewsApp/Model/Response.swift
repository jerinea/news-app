//
//  Response.swift
//  NewsApp
//
//  Created by Jerin Emmanuel on 12/17/20.
//

import Foundation

struct Response<T: Decodable>: Decodable {
    let status: String
    let copyright: String
    let num_results: Int
    let results: T?
}
