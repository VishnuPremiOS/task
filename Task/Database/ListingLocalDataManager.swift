//
//  ListingLocalDataManager.swift
//  Task
//
//  Created by NigilKowsi on 04/06/24.
//

import RealmSwift

class ListingLocalDataManager: ListingLocalDataManagerProtocol {
    private let realm = try! Realm()

    func saveListings(_ listings: [ListingEntity]) {
        try! realm.write {
            realm.add(listings, update: .modified)
        }
    }

    func fetchListings() -> [ListingEntity]? {
        return Array(realm.objects(ListingEntity.self))
    }
}
