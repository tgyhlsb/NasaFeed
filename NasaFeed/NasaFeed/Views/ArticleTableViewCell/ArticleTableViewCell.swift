//
//  ArticleTableViewCell.swift
//  NasaFeed
//
//  Created by Tanguy Hélesbeux on 26/09/2016.
//  Copyright © 2016 Tanguy Helesbeux. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell, Reusable {

    // MARK: - PUBLIC -
    
    public var title: String {
        get { return self.titleLabel.text ?? "" }
        set { self.titleLabel.text = newValue }
    }
    
    // MARK: - INTERNAL -
    
    // MARK: - PRIVATE -
    
    // MARK: IBOutlets

    @IBOutlet weak var titleLabel: UILabel!
    
}
