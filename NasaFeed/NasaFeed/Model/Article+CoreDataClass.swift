//
//  Article+CoreDataClass.swift
//  NasaFeed
//
//  Created by Tanguy Hélesbeux on 26/09/2016.
//  Copyright © 2016 Tanguy Helesbeux. All rights reserved.
//

import Foundation
import CoreData


public class Article: NSManagedObject {
    
    // MARK: - PUBLIC -
    
    public var title: String {
        get { return self.sTitle ?? "No title" }
        set { self.sTitle = newValue }
    }
    
    public var text: String {
        get { return self.sDescription ?? " No text" }
        set { self.sDescription = newValue }
    }
    
    public var date: Date {
        get { return self.sDate as! Date }
        set { self.sDate = newValue as NSDate }
    }
    
    public var imageUrl: String? {
        get { return self.sImageUrl }
        set { self.sImageUrl = newValue }
    }
    
    public var image: Data? {
        get { return self.bImage as Data? }
        set { self.bImage = newValue as NSData? }
    }
    
    public var thumbnail: Data? {
        get { return self.bThumbnail as Data? }
        set { self.bThumbnail = newValue as NSData? }
    }
    
    // MARK: - INTERNAL -
    
    // MARK: - PRIVATE -

}
