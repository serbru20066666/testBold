//
//  SearchViewModel.swift
//  TestBold
//
//  Created by bruno cardenas on 10/05/22.
//

import Foundation

protocol SearchViewModelDelegate: AnyObject {
    func placesReceived(places:[Place])
    func error(message:String)
}
class SearchViewModel {
    var delegate:SearchViewModelDelegate?
    var service:SearchService?
    init(service:SearchService) {
        self.service = service
    }
    
    func getPlaces(namePlace:String) {
        self.service?.getPlaces(namePlace: namePlace, completion: { places, error in
            guard let placesObjs = places else {
                self.delegate?.error(message: error?.message ?? "")
                return
            }
            self.delegate?.placesReceived(places: placesObjs)
        })
    }
    
}
