//
//  NavigationController.swift
//  NasaFeed
//
//  Created by Tanguy Hélesbeux on 26/09/2016.
//  Copyright © 2016 Tanguy Helesbeux. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    // MARK: - PUBLIC -
    
    // MARK: - INTERNAL -
    
    // MARK: - PRIVATE -
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeAppearance()
    }
    
    // MARK: Appearance
    
    private func initializeAppearance() {
        self.navigationBar.isTranslucent = false
    }

}
