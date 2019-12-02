//
//  QueryRepositoriesTests.swift
//  QueryRepositoriesTests
//
//  Created by Rodrigo Albuquerque on 29/11/2019.
//  Copyright © 2019 Rodrigo Albuquerque. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import QueryRepositoriesTests

class QueryRepositoriesTests: QuickSpec {
    override func spec() {
        var sut: RepositoriesListController?
        
        describe("Layout") {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "RepositoriesListController") as! RepositoriesListController
            vc.loadView()
            sut = vc
            
            ///VALIDATE STAUS
            it("check showing status") {
                           sut?.didLoadRepositories(repositories: [Repositories()])
                           expect(sut?.tableView.isHidden).to(beFalse())
            }
            
            ///CHECK LOADING STATUS
            it("check loading status") {
                sut?.viewDidLoad()
                expect(sut?.loading.isHidden).to(beFalse())
            }
            
            /// CHECK ERROR STATUS
            it("check error status") {
                sut?.didFailedLoadRepositories()
                expect(sut?.errorLabel.isHidden).to(beFalse())
                expect(sut?.errorLabel.text).to(equal("Error processing your request"))
            }
            
            ///VALIDATE NIL
            it("cannot be nil") {
                sut?.viewDidLoad()
                expect(sut).toNot(beNil())
            }
    
            it("check empty status") {
                sut?.didLoadRepositories(repositories: [])
                expect(sut?.errorLabel.isHidden).to(beFalse())
                expect(sut?.errorLabel.text).to(equal("no repository found"))
            }

        }
    }
}
 
