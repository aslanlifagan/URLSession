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
        self.listener?(.loading)
        CoreAPIManager.instance.request(type: CommentList.self, path: "comments") { [weak self] result in
            guard let self = self else {return}
            self.listener?(.loaded)
            switch result {
                case .success(let list):
                    self.list = list
                    self.listener?(.success)
                case .failure(let error):
                    listener?(.error(error.localizedDescription))
            }
        }
    }
    
    func getPostList() {
        self.listener?(.loading)
        CoreAPIManager.instance.request(type: PostList.self, path: "posts") { [weak self] result in
            guard let self = self else {return}
            self.listener?(.loaded)
            switch result {
                case .success(let list):
//                    self.list = list
                    self.postList = list
                    self.listener?(.success)
                case .failure(let error):
                    listener?(.error(error.localizedDescription))
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
