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
    private (set) var list: CountryList?
    
    var listener: ((ViewState) -> Void)?
    
    func getCountryListRequest() {
        listener?(.loading)
        AllCountryAPIService.instance.getCountry { [weak self] data, error in
            guard let self = self else {return}
            listener?(.loaded)
            if let data = data {
                list = data
                print(#function, data)
                listener?(.success)
            } else if let error = error {
                listener?(.error(error.localizedDescription))
            }
        }
    }
    
    func sortedAToZList() {
        list = list?.sorted(by: {$0.titleString < $1.titleString})
        listener?(.success)
    }
    
    func sortedAreaList() {
        list = list?.sorted(by: {$0.area ?? 0.0 > $1.area ?? 0.0})
        listener?(.success)
    }
    
    func getProtocol(index: Int) -> TitleSubtitleProtocol? {
        return list?[index]
    }
    
    func getItems() -> Int {
        list?.count ?? 0
    }
    
    
}
