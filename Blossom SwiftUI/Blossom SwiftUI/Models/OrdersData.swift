//
//  OrdersData.swift
//  Blossom SwiftUI
//
//  Created by Adina Chiriliuc on 14/08/2020.
//  Copyright © 2020 Adina Chiriliuc. All rights reserved.
//

import UIKit

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    
    var id : String {
        return customer_id
    }
    let customer_id: String
    let description_name: String
    let price: String
    let customer_name: String
    let customer_address: String
}


