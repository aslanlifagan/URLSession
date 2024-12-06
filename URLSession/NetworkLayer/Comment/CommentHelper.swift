//
//  CommenHelper.swift
//  URLSession
//
//  Created by Aslanli Faqan on 27.11.24.
//

import Foundation
import Alamofire
enum CommentHelper: CoreAPIConfiguration {
    case comment
    case postId(id: Int)
    
    var baseURL: String {
        "https://jsonplaceholder.typicode.com/"
    }
    
    var header: HTTPHeader {
        return HTTPHeader(name: "", value: "")
    }
    var mainPath: String {
        "comments/"
    }
    
    var path: String {
        switch self {
            case .comment:
                ""
            case .postId(let id):
                "?postId=\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .comment: .get
            case .postId(let id): .post
        }
    }
    
    var parameter: Parameters? {
        switch self {
            case .comment:
                nil
            case .postId(let id):
                nil
        }
    }
}
