//
//  DetailViewModel.swift
//  TestBold
//
//  Created by bruno cardenas on 10/05/22.
//

import Foundation
protocol DetailViewModelDelegate: AnyObject {
    func detailReceived(detail:PlaceDetail)
    func error(message:String)
}
class DetailViewModel {
    var delegate:DetailViewModelDelegate?
    var service:DetailService?
    init(service:DetailService) {
        self.service = service
    }
    
    func getDetail(woid:String) {
        self.service?.getDetail(woid: woid, completion: { detail, error in
            guard let detailObj = detail else {
                self.delegate?.error(message: error?.message ?? "")
                return
            }
            self.delegate?.detailReceived(detail:detailObj)
        })
    }
    
}
