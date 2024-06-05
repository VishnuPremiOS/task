//
//  ListingPresenter.swift
//  Task
//
//  Created by NigilKowsi on 04/06/24.
//

class ListingPresenter: ListingPresenterProtocol {
    weak var view: ListingViewProtocol?
    var interactor: ListingInteractorInputProtocol?
    var router: ListingRouterProtocol?

    func viewDidLoad() {
        interactor?.fetchListings()
    }

    func didSelectListing(_ listing: ListingEntity) {
        router?.navigateToDetailsScreen(from: view!, with: listing)
    }
}

extension ListingPresenter: ListingInteractorOutputProtocol {
    func didFetchListings(_ listings: [ListingEntity]) {
        view?.showListings(listings)
    }

    func didFailToFetchListings(_ error: Error) {
        view?.showError(error)
    }
}

