//
//  PostAPIManager.swift
//  URLSession
//
//  Created by Aslanli Faqan on 27.11.24.
//

import Foundation
final class PostAPIManager {
    private init() {}
    static let instance = PostAPIManager()
    
    func getPostList(completion: @escaping((PostList?, CoreErrorModel?) -> Void)) {
        CoreAPIManager.instance.request(
            type: PostList.self,
            url: PostHelper.posts.path,
            method: .GET) { [weak self] result in
                guard let _ = self else {return}
                switch result {
                    case .success(let list):
                        completion(list,nil)
                    case .failure(let error):
                        completion(nil,error)
                }
            }
    }
    
    func createPost(body: [String : Any], completion: @escaping((PostList?, CoreErrorModel?) -> Void)) {
        CoreAPIManager.instance.request(
            type: PostList.self,
            url: PostHelper.posts.path,
            method: .POST,
            header: ["Content-type": "application/json; charset=UTF-8"],
            body: body
        ) { [weak self] result in
                guard let _ = self else {return}
                switch result {
                    case .success(let data):
                        completion(data,nil)
                    case .failure(let error):
                        completion(nil,error)
                }
            }
    }
}
