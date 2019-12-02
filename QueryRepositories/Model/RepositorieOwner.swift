//
//  RepositorieOwner.swift
//  QueryRepositories
//
//  Created by Rodrigo Albuquerque on 29/11/2019.
//  Copyright © 2019 Rodrigo Albuquerque. All rights reserved.
//

import Foundation
import ObjectMapper

class RepositorieOwner: Mappable {
    var avatar_url: String?
    var login: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        avatar_url <- map["avatar_url"]
        login <- map["login"]
    }
    

}


