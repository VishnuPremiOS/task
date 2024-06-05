//
//  Protocol.swift
//  Task
//
//  Created by NigilKowsi on 04/06/24.
//

import Foundation
import UIKit

protocol ListingPresenterProtocol: AnyObject {
    var view: ListingViewProtocol? { get set }
    var interactor: ListingInteractorInputProtocol? { get set }
    var router: ListingRouterProtocol? { get set }

    func viewDidLoad()
    func didSelectListing(_ listing: ListingEntity)  // Add this method

}

protocol ListingViewProtocol: AnyObject {
    var presenter: ListingPresenterProtocol? { get set }

    // Methods for updating the view
    func showListings(_ listings: [ListingEntity])
    func showError(_ error: Error)
}

protocol ListingInteractorInputProtocol: AnyObject {
    var presenter: ListingInteractorOutputProtocol? { get set }
    var localDataManager: ListingLocalDataManagerProtocol? { get set }
    var remoteDataManager: ListingRemoteDataManagerProtocol? { get set }

    func fetchListings()
}


protocol ListingInteractorOutputProtocol: AnyObject {
    func didFetchListings(_ listings: [ListingEntity])
    func didFailToFetchListings(_ error: Error)
}


protocol ListingRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func navigateToDetailsScreen(from view: ListingViewProtocol, with listing: ListingEntity)
}


protocol ListingLocalDataManagerProtocol: AnyObject {
    func saveListings(_ listings: [ListingEntity])
    func fetchListings() -> [ListingEntity]?
}


protocol ListingRemoteDataManagerProtocol: AnyObject {
    func fetchListings(completion: @escaping ([ListingEntity]?, Error?) -> Void)
}
