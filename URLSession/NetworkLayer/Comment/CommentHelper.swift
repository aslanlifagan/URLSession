//
//  CommenHelper.swift
//  URLSession
//
//  Created by Aslanli Faqan on 27.11.24.
//

import Foundation
enum CommentHelper {
    case comment
    case postId(id: Int)
    
    var endpoint: String {
        switch self {
            case .comment:
                ""
            case .postId(let id):
                "?postId=\(id)"
        }
    }
    
    private var basePath: String {
        return "comments/"
    }
    
    var path: URL? {
        switch self {
            case .comment:
                return CoreAPIHelper.instance.makeURL(path: basePath + self.endpoint)
            case .postId:
                return CoreAPIHelper.instance.makeURL(path: basePath + self.endpoint)
        }
        
    }
}
