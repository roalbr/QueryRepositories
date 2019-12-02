//
//  RepositoriesListViewModel.swift
//  QueryRepositories
//
//  Created by Rodrigo Albuquerque on 29/11/2019.
//  Copyright © 2019 Rodrigo Albuquerque. All rights reserved.
//

import Foundation

protocol RepositoriesListProtocol {
    func didLoadRepositories(repositories: [Repositories])
    func didFailedLoadRepositories()
}

class RepositoriesListViewModel {
    let delegate: RepositoriesListProtocol
    let service = Service()
    
    init(delegate: RepositoriesListProtocol) {
        self.delegate = delegate
    }
    
    func loadData(page: Int) {
        service.getTopRepositories(page: page) { (response) in
            if response.error != nil {
                self.delegate.didFailedLoadRepositories()
            } else {
                 switch response.result {
                 case .success(let result):
                    self.delegate.didLoadRepositories(repositories: result.items!)
                 case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
