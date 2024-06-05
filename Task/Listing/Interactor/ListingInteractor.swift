//
//  ListingInteractor.swift
//  Task
//
//  Created by NigilKowsi on 04/06/24.
//

import Foundation

class ListingInteractor: ListingInteractorInputProtocol {
    var presenter: ListingInteractorOutputProtocol?
    var localDataManager: ListingLocalDataManagerProtocol?
    var remoteDataManager: ListingRemoteDataManagerProtocol?

    func fetchListings() {
        remoteDataManager?.fetchListings { [weak self] listings, error in
            if let listings = listings {
                self?.localDataManager?.saveListings(listings)
                self?.presenter?.didFetchListings(listings)
            } else if let error = error {
                self?.presenter?.didFailToFetchListings(error)
            }
        }
    }
}
