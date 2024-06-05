//
//  DetailsViewController.swift
//  Task
//
//  Created by NigilKowsi on 04/06/24.
//

import UIKit

class DetailsViewController: UIViewController {
    var listing: ListingEntity?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        guard let listing = listing else { return }
        nameLabel.text = listing.name
        countryLabel.text = listing.country
    }

    @IBAction func refreshButtonTapped(_ sender: UIBarButtonItem) {
        NotificationCenter.default.post(name: NSNotification.Name("RefreshListings"), object: nil)
        self.dismiss(animated: true, completion: nil)
    }
}
