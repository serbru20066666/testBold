//
//  SearchService.swift
//  TestBold
//
//  Created by bruno cardenas on 10/05/22.
//

import Foundation

class SearchService {
    
    func getPlaces(namePlace:String, completion:@escaping ([Place]?, testError?) -> Void) -> Void {
        let url = Urls.search + namePlace
        ApiCMBService.shared().request(url, httpMethod: .get, params: nil, headers: nil) { result in
            switch result {
            case .success(let json):
                let response = try? JSONDecoder().decode([Place].self, from: json.rawData())
                guard let responseObj = response else { return completion(nil,testError(message: "Error de servicio"))}
                completion(responseObj,nil)
            case .failure(let error):
                completion(nil,testError(message: error.localizedDescription))
                print(error.localizedDescription)
            }
            
        }
        
    }
}
