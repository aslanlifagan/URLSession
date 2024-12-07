//
//  CountryDetailViewModel.swift
//  URLSession
//
//  Created by Aslanli Faqan on 07.12.24.
//

import Foundation
final class CountryDetailViewModel {
    enum ViewState {
        case loading
        case loaded
        case success
        case error(String)
    }
    private let country: CountryDTO
    
    init(country: CountryDTO) {
        self.country = country
    }
    
    var listener: ((ViewState) -> Void)?
}
