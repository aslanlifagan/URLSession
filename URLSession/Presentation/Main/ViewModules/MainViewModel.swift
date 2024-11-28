//
//  MainViewModel.swift
//  URLSession
//
//  Created by Aslanli Faqan on 22.11.24.
//

import Foundation
final class MainViewModel {
    enum ViewState {
        case loading
        case loaded
        case success
        case error(String)
    }
    private (set) var list: CommentList?
    private (set) var postList: PostList?
    
    var listener: ((ViewState) -> Void)?
    
    func getCommentList() {
        listener?(.loading)
        CommentAPIManager.instance.getCommentList { [weak self] response, error in
            guard let self = self else {return}
            self.listener?(.loaded)
            guard let error = error else {
                if let response = response {
                    list = response
                    listener?(.success)
                }
                return
            }
            listener?(.error(error.message ?? ""))
            
        }
    }
    
    func getCommentWithPost() {
        listener?(.loading)
        CommentAPIManager.instance.getCommentList(with: 3) { [weak self] response, error in
            guard let self = self else {return}
            self.listener?(.loaded)
            if let response = response {
                list = response
                self.listener?(.success)
            } else if let error = error {
                self.listener?(.error(error.message ?? ""))
            }
        }
    }
    
    func getPostList() {
        self.listener?(.loading)
        PostAPIManager.instance.getPostList { [weak self] response, error in
            guard let self = self else {return}
            self.listener?(.loaded)
            if let response = response {
                postList = response
                self.listener?(.success)
            } else if let error = error {
                self.listener?(.error(error.message ?? ""))
            }
        }
    }
    
    func createPost() {
        let body: [String: Any] = [
            "title": "Test",
            "body": "ksajdbasjhkdbsahjbaskhjdbasjdbaskhjdbasjdbahjdbasjhdbsahjd",
            "userId": 1000
        ]
        listener?(.loading)
        PostAPIManager.instance.createPost(body: body){ [weak self] response, error in
            guard let self = self else {return}
            self.listener?(.loaded)
            if let response = response {
                postList = response
                print(response)
                self.listener?(.success)
            } else if let error = error {
                self.listener?(.error(error.message ?? ""))
            }
        }
    }
    
    func getProtocol(index: Int) -> TitleSubtitleProtocol? {
        return postList?[index]
    }
    
    func getItems() -> Int {
        postList?.count ?? 0
    }
}
