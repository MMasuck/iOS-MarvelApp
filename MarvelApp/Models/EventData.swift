//
//  EventData.swift
//  MarvelApp
//
//  Created by Mariel Masuck on 27/09/2022.
//  Copyright © 2022 Mmasuck. All rights reserved.
//

import SwiftUI

struct MarvelEventsData: Codable {
    let `data`: EventData
}

struct EventData: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Event]
}

struct Event: Codable {
    let id: Int
    let title: String
    let description: String
    let resourceURI: String
    let urls: [UrlElements]
    let start: String?
    let end: String?
    let thumbnail: [EventImages]
}

struct UrlElements: Codable {
    let type: String
    let url: String
}

struct EventImages: Codable {
    let path: String
    let `extension`: String
}

