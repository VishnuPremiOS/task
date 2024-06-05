//
//  ListingRemoteDataManager.swift
//  Task
//
//  Created by NigilKowsi on 04/06/24.
//

import Alamofire

class ListingRemoteDataManager: ListingRemoteDataManagerProtocol {
    func fetchListings(completion: @escaping ([ListingEntity]?, Error?) -> Void) {
        let url = "http://universities.hipolabs.com/search?country=United%20Arab%20Emirates"
        AF.request(url).responseDecodable(of: [ListingEntity].self) { response in
            switch response.result {
            case .success(let listings):
                completion(listings, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
