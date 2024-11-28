//
//  PostHelper.swift
//  URLSession
//
//  Created by Aslanli Faqan on 27.11.24.
//

import Foundation
enum PostHelper {
    case posts
    
    var endpoint: String {
        switch self {
            case .posts:
                ""
        }
    }
    
    private var basePath: String {
        return "posts/"
    }
    
    var path: URL? {
        switch self {
            case .posts:
                return CoreAPIHelper.instance.makeURL(path: basePath + self.endpoint)
        }
        
    }
}
