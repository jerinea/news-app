//
//  News.swift
//  NewsApp
//
//  Created by Jerin Emmanuel on 12/17/20.
//

import Foundation

fileprivate enum MediaFormat: String {
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case mediumThreeByTwo440 = "mediumThreeByTwo440"
}

struct News: Decodable {
    
    let title: String?
    
    let byline: String?
    
    let section: String?
    
    let published_date: String?
    
    let abstract: String?
    
    let media: [Media]?
    
    var thumbNail: String? {
        get {
            if let media = self.media?.first {
                return media.mediaMetadata.first(where: {$0.format == MediaFormat.mediumThreeByTwo210.rawValue})?.url
            }
            return nil
        }
    }
    
    var bigImage: String? {
        get {
            if let media = self.media?.first {
                return media.mediaMetadata.first(where: {$0.format == MediaFormat.mediumThreeByTwo440.rawValue})?.url
            }
            return nil
        }
    }
}

struct Media: Decodable {
    
    let mediaMetadata: [MediaMetadata]
    
    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetadata: Decodable {
    
    let url: String?
    let format: String
}

