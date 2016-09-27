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
    
    public struct Item {
        var title, text, date, image: String?
        
        var formattedDate: Date? {
            guard let string = self.date else { return nil }
            let formatter = DateFormatter()
            return formatter.date(from: string)
        }
    }
    
    public func parse(data: Data) {
        let parser = XMLParser(data: data)
        parser.delegate = self
        parser.parse()
    }
    
    public var items = [Item]()
    
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
        print(attributeDict)
        if elementName == "item" {
            self.title = ""
            self.text = ""
            self.date = ""
        } else if elementName == "enclosure" {
            self.image = attributeDict["url"]
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
            var item = Item()
            item.title = self.format(string: self.title)
            item.text = self.format(string: self.text)
            item.date = self.format(string: self.date)
            item.image = self.format(string: self.image)
            self.items.append(item)
            
            self.title = nil
            self.text = nil
            self.date = nil
            self.image = nil
        }
     }

    private func format(string: String?) -> String? {
        return string?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}
