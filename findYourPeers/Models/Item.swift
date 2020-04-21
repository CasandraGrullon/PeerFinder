//
//  Item.swift
//  findYourPeers
//
//  Created by casandra grullon on 4/21/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import Foundation

struct Item: Codable {
    let datePosted: Date
    let id: String
    let itemCondition: String
    let itemDescription: String
    let itemImages: [String]
    let itemName: String
    let itemPrice: Double
    let sellerEmail: String
    let sellerId: String
    let sellerName: String
}
