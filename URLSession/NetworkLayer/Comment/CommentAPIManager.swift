//
//  CommentAPIManager.swift
//  URLSession
//
//  Created by Aslanli Faqan on 27.11.24.
//

import Foundation
final class CommentAPIManager: CommentUseCase {
    private init() {}
    static let instance = CommentAPIManager()
    
    func getCommentList(
        completion: @escaping((CommentList?, CoreErrorModel?) -> Void)
    ) {
        CoreAPIManager.instance.request(type: CommentList.self, route: CommentHelper.comment, completion: completion)
    }
    
    func getCommentList(
        with postId: Int,
        completion: @escaping((CommentList?, CoreErrorModel?) -> Void)
    ) {
        CoreAPIManager.instance.request(type: CommentList.self,route: CommentHelper.postId(id: postId), completion: completion)
    }
}
