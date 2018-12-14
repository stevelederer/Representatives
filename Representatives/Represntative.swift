//
//  Represntative.swift
//  Representatives
//
//  Created by Steve Lederer on 12/13/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

import Foundation

struct TopLevelDictionary: Decodable {
    let results: [Representative]
}

struct Representative: Decodable {
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
}
