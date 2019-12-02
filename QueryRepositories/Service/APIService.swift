//
//  APIService.swift
//  QueryRepositories
//
//  Created by Rodrigo Albuquerque on 29/11/2019.
//  Copyright © 2019 Rodrigo Albuquerque. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Alamofire

class Service {
    let baseUrl: String = "http://api.github.com/"
    public func getTopRepositories(page: Int,
                                   completionHandler: @escaping (AFDataResponse<RepositoriesResponse>) -> Void) {
        let requestUrl: String = "\(self.baseUrl)search/repositories?q=stars&sort=stars&per_page=15&page=\(page)"
        guard let url = URL(string: requestUrl) else {
            return
        }
        AF.request(url).responseObject { (response: AFDataResponse<RepositoriesResponse>) in
            completionHandler(response)
        }
    }
}

