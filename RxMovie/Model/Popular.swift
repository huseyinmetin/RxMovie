//
//  Popular.swift
//  RxMovie
//
//  Created by Hüseyin Metin on 23.01.2020.
//  Copyright © 2020 HüseyinMetin. All rights reserved.
//

import Foundation

struct Popular: Decodable {
    let page: Int
    let total_results: Int
    let total_pages: Int
    let results: [PopularItem]
}


