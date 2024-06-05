//
//  ListingRouter.swift
//  Task
//
//  Created by NigilKowsi on 04/06/24.
//

import UIKit

class ListingRouter: ListingRouterProtocol {
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ListingViewController") as! ListingViewController
        let presenter: ListingPresenterProtocol & ListingInteractorOutputProtocol = ListingPresenter()
        let interactor: ListingInteractorInputProtocol = ListingInteractor()
        let localDataManager: ListingLocalDataManagerProtocol = ListingLocalDataManager()
        let remoteDataManager: ListingRemoteDataManagerProtocol = ListingRemoteDataManager()
        let router: ListingRouterProtocol = ListingRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.localDataManager = localDataManager
        interactor.remoteDataManager = remoteDataManager

        return view
    }

    func navigateToDetailsScreen(from view: ListingViewProtocol, with listing: ListingEntity) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsViewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsViewController.listing = listing
        detailsViewController.modalPresentationStyle = .fullScreen

        if let viewController = view as? UIViewController {
            viewController.navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
}
