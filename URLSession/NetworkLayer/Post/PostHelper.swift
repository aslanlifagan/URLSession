//
//  PostHelper.swift
//  URLSession
//
//  Created by Aslanli Faqan on 27.11.24.
//

import Alamofire
import Foundation
enum PostHelper: CoreAPIConfiguration {
    case getPosts
    case createPosts([String: Any])
    
    var baseURL: String {
        "https://jsonplaceholder.typicode.com/"
    }
    
    var header: HTTPHeader {
        return HTTPHeader(name: "", value: "")
    }
    var mainPath: String {
        "posts/"
    }
    
    var path: String {
        switch self {
            case .getPosts: ""
            case .createPosts: ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .getPosts:
                    .get
            case .createPosts:
                    .post
        }
    }
    
    var parameter: Parameters? {
        switch self {
            case .getPosts: return nil
            case .createPosts(let body): return body
        }
    }
}
