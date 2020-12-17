//
//  Environment.swift
//  NewsApp
//
//  Created by Jerin Emmanuel on 12/17/20.
//

import Foundation

public struct Environment {
    
    private static func infoForKey(_ key: String) -> String? {
        return (Bundle.main.infoDictionary?[key] as? String)?
            .replacingOccurrences(of: "\\", with: "")
    }
    
    public static var apiBase: String {
        guard let url = self.infoForKey("ApiBase") else {
            fatalError("ApiBase is not configured in Config")
        }
        return url
    }
    
    public static var apiKey: String {
        guard let url = self.infoForKey("ApiKey") else {
            fatalError("ApiKey is not configured in Config")
        }
        return url
    }
}
