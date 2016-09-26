//
//  RssParser.swift
//  NasaFeed
//
//  Created by Tanguy Hélesbeux on 26/09/2016.
//  Copyright © 2016 Tanguy Helesbeux. All rights reserved.
//

import UIKit

class RssParser: NSObject, XMLParserDelegate {
    
    // MARK: - PUBLIC -
    
    public func parse(data: Data) {
        let parser = XMLParser(data: data)
        parser.delegate = self
        parser.parse()
    }
    
    public var elements = [[String: String?]]()
    
    // MARK: - INTERNAL -
    
    // MARK: - PRIVATE -
    
    private var currentElement: String?
    private var title: String?
    private var text: String?
    private var date: String?
    private var image: String?
    
    // MARK: XMLParserDelegate
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        self.currentElement = elementName
        if elementName == "item" {
            self.title = ""
            self.text = ""
            self.date = ""
            self.image = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        guard let element = self.currentElement else { return }
        guard self.title != nil else { return }
        switch element {
            case "title": self.title! += string
            case "description": self.text! += string
            case "pubDate": self.date! += string
            default: break
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            let element = [
                "title": self.title,
                "text": self.description,
                "date": self.date,
                "image": self.image
            ]
            self.elements.append(element)
            
            self.title = nil
            self.text = nil
            self.date = nil
            self.image = nil
        }
     }


}
