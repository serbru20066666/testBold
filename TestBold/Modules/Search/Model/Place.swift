//
//  Place.swift
//  TestBold
//
//  Created by bruno cardenas on 10/05/22.
//

import Foundation

struct Place: Decodable {
    let title, location_type: String?
    let woeid: Int?
    let lattLong: String?
}
