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
    
    public var date: Date = Date() {
        didSet {
            self.subtitleLabel.text = self.string(from: self.date)
        }
    }
    
    public var thumbnail: UIImage? {
        get { return self.thumbnailView.image }
        set { self.thumbnailView.image = newValue }
    }
    
    // MARK: - INTERNAL -
    
    // MARK: - PRIVATE -
    
    // MARK: IBOutlets

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var thumbnailView: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.thumbnailView.layer.cornerRadius = self.thumbnailView.layer.frame.size.height / 2.00
    }
    
    private func string(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: self.date)
    }
    
}
