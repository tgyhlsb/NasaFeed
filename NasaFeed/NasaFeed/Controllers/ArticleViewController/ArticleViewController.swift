//
//  ArticleViewController.swift
//  NasaFeed
//
//  Created by Tanguy Hélesbeux on 26/09/2016.
//  Copyright © 2016 Tanguy Helesbeux. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {
    
    // MARK: - PUBLIC -
    
    public init(article: Article) {
        self.article = article
        super.init(nibName: "ArticleViewController", bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - INTERNAL -
    
    // MARK: - PRIVATE -
    
    private let article: Article
    
    // MARK: IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setView(for: self.article)
    }
    
    // MARK: Appearance
    
    private func setView(for article: Article) {
        self.title = article.title
        self.textView.text = article.text
        
        if let imageData = article.image {
            self.imageView.image = UIImage(data: imageData)
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .medium
        self.dateLabel.text = dateFormatter.string(from: article.date)
    }

}
