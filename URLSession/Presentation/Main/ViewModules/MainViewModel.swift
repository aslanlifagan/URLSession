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
    
    //    func getPostList() {
    //        self.listener?(.loading)
    //        CoreAPIManager.instance.request(type: PostList.self, path: "posts") { [weak self] result in
    //            guard let self = self else {return}
    //            self.listener?(.loaded)
    //            switch result {
    //                case .success(let list):
    //                    //                    self.list = list
    //                    self.postList = list
    //                    self.listener?(.success)
    //                case .failure(let error):
    //                    listener?(.error(error.localizedDescription))
    //            }
    //        }
    //    }
    
    func getProtocol(index: Int) -> TitleSubtitleProtocol? {
        return list?[index]
    }
    
    func getItems() -> Int {
        list?.count ?? 0
    }
}
