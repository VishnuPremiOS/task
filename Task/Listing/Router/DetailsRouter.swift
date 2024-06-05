//
//  DetailsRouter.swift
//  Task
//
//  Created by NigilKowsi on 04/06/24.
//

import UIKit

class DetailsRouter {
    static func createModule(with listing: ListingEntity) -> UIViewController {
        let view = DetailsViewController()
        view.listing = listing
        return view
    }
}
