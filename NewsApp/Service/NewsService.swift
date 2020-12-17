//
//  NewsService.swift
//  NewsApp
//
//  Created by Jerin Emmanuel on 12/17/20.
//

import Foundation

class NewsService {
    
    static let shared = NewsService()
    
    func getNews(period: Int, completion: @escaping (Result<[News], Error>) -> Void)  {
        
        let getNews = GetNews(section: "all-sections", period: period)
        APIClient.shared.perform(getNews) { (result) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
