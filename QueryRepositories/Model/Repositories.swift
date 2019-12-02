//
//  Repositories.swift
//  QueryRepositories
//
//  Created by Rodrigo Albuquerque on 29/11/2019.
//  Copyright © 2019 Rodrigo Albuquerque. All rights reserved.
//

import Foundation
import ObjectMapper

class Repositories: Mappable {
    var id: Int?
    var name: String?
    var stargazers_count: Int?
    var owner: RepositorieOwner?
    
    required init?(map: Map){
        
    }
    
    init() {}
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        stargazers_count <- map["stargazers_count"]
        owner <- map["owner"]
    }
}

