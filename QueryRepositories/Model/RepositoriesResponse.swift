//
//  RepositoriesResponse.swift
//  QueryRepositories
//
//  Created by Rodrigo Albuquerque on 29/11/2019.
//  Copyright © 2019 Rodrigo Albuquerque. All rights reserved.
//

import Foundation
import ObjectMapper

class RepositoriesResponse: Mappable {
    var total_count: Int?
    var incomplete_results: Bool?
    var items: [Repositories]?
 
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        total_count <- map["total_count"]
        incomplete_results <- map["incomplete_results"]
        items <- map["items"]
    }
    

}

