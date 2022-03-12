//  CountryModel.swift
//
//
//  Created by Reza Kashkoul on 1/12/1400 AP.
//

import Foundation

struct Country: Codable, Comparable {
    static func == (lhs: Country, rhs: Country) -> Bool {
        return rhs.name.official.lowercased() == lhs.name.official.lowercased()
    }
    
    static func < (lhs: Country, rhs: Country) -> Bool {
        return rhs.name.official.lowercased() > lhs.name.official.lowercased()
    }
    
    let name: Name
    //    let flag: String
}

struct Name: Codable {
    
    let official: String
}
