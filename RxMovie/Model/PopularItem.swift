//
//  PopularItem.swift
//  RxMovie
//
//  Created by Hüseyin Metin on 23.01.2020.
//  Copyright © 2020 HüseyinMetin. All rights reserved.
//

import Foundation

struct PopularItem: Decodable {
    let original_name: String
    let genre_ids: [Int]
    let name: String
    let popularity: Double
    let origin_country: [String]
    let vote_count: Int?
    let first_air_date: Date?
    let backdrop_path: String?
    let original_language: String?
    let id: Int
    let vote_average: Double?
    let overview: String?
    let poster_path: String?
}
