//
//  Article+CoreDataProperties.swift
//  NasaFeed
//
//  Created by Tanguy Hélesbeux on 28/09/2016.
//  Copyright © 2016 Tanguy Helesbeux. All rights reserved.
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article");
    }

    @NSManaged public var sDate: NSDate?
    @NSManaged public var sDescription: String?
    @NSManaged public var sImageUrl: String?
    @NSManaged public var sTitle: String?
    @NSManaged public var bImage: NSData?
    @NSManaged public var bThumbnail: NSData?

}
