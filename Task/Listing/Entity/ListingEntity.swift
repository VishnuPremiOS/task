//
//  ListingEntity.swift
//  Task
//
//  Created by NigilKowsi on 04/06/24.
//

import RealmSwift

class ListingEntity: Object, Decodable {
    @objc dynamic var alphaTwoCode: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var country: String = ""
    @objc dynamic var stateProvince: String?

    var domains = List<String>()
    var webPages = List<String>()

    override static func primaryKey() -> String? {
        return "name"
    }

    enum CodingKeys: String, CodingKey {
        case alphaTwoCode = "alpha_two_code"
        case name
        case country
        case stateProvince = "state-province"
        case domains
        case webPages = "web_pages"
    }

    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        alphaTwoCode = try container.decode(String.self, forKey: .alphaTwoCode)
        name = try container.decode(String.self, forKey: .name)
        country = try container.decode(String.self, forKey: .country)
        stateProvince = try container.decodeIfPresent(String.self, forKey: .stateProvince)
        
        let domainsArray = try container.decode([String].self, forKey: .domains)
        domains.append(objectsIn: domainsArray)
        
        let webPagesArray = try container.decode([String].self, forKey: .webPages)
        webPages.append(objectsIn: webPagesArray)
    }
}

