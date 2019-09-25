//
//  Order.swift
//  OrderApp
//
//  Created by Oniel Rosario on 9/24/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import SwiftUI

class Order: ObservableObject {
    @Published var items = [MenuItem]()
    
    var total: Int {
        if items.count > 0 {
            return items.reduce(0) { $0 +
                $1.price }
        } else {
            return 0
        }
    }
    
    func add(item: MenuItem) {
        items.append(item)
    }
    
    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
