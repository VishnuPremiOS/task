//
//  ListingViewController.swift
//  Task
//
//  Created by NigilKowsi on 04/06/24.
//

import UIKit

class ListingViewController: UIViewController, ListingViewProtocol {
    @IBOutlet weak var tableView: UITableView!

    var presenter: ListingPresenterProtocol?
    var listings: [ListingEntity] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ListingViewController viewDidLoad")
              if presenter == nil {
                  print("Presenter is nil")
              } else {
                  print("Presenter is set")
                  presenter?.viewDidLoad()
              }
        setupTableView()
        setupRefreshNotification()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "ListingCell")
    }

    private func setupRefreshNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(refreshListings), name: NSNotification.Name("RefreshListings"), object: nil)
    }

    @objc private func refreshListings() {
        presenter?.viewDidLoad()
    }

    // ListingViewProtocol methods
    func showListings(_ listings: [ListingEntity]) {
        self.listings = listings
        tableView.reloadData()
    }

    func showError(_ error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ListingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListingCell", for: indexPath) as! CustomTableViewCell
        let listing = listings[indexPath.row]
        cell.nameLabel.text = listing.name
        cell.detailLabel.text = listing.country
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let listing = listings[indexPath.row]
        presenter?.didSelectListing(listing)
    }
}
