//
//  CharacterData.swift
//  MarvelApp
//
//  Created by Mariel Masuck on 27/09/2022.
//  Copyright © 2022 Mmasuck. All rights reserved.
//

import SwiftUI


struct MarvelCharacterData: Codable {
    let data: CharacterData
}

struct CharacterData: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Character]
}

struct Character: Codable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Images
    let resourceURI: String
    let comics: ComicsElements
}

struct Images: Codable {
    let path: String
    let `extension`: String
}

struct ComicsElements: Codable {
    let available: Int
    let collectionURI: String
}
