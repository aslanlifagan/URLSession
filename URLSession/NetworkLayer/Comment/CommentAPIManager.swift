//
//  CommentAPIManager.swift
//  URLSession
//
//  Created by Aslanli Faqan on 27.11.24.
//

import Foundation
final class CommentAPIManager {
    private init() {}
    static let instance = CommentAPIManager()
    
    func getCommentList(completion: @escaping((CommentList?, CoreErrorModel?) -> Void)) {
        CoreAPIManager.instance.request(
            type: CommentList.self,
            url: CommentHelper.comment.path,
            method: .GET) { [weak self] result in
                guard let _ = self else {return}
                switch result {
                    case .success(let list):
                        completion(list, nil)
                    case .failure(let error):
                        completion(nil, error)
                }
            }
    }
    
    func getCommentList(with postId: Int, completion: @escaping((CommentList?, CoreErrorModel?) -> Void)) {
        CoreAPIManager.instance.request(
            type: CommentList.self,
            url: CommentHelper.postId(id: postId).path,
            method: .GET) { [weak self] result in
                guard let _ = self else {return}
                switch result {
                    case .success(let list):
                        completion(list, nil)
                    case .failure(let error):
                        completion(nil, error)
                }
            }
    }
}
