//
//  ItemDetail.swift
//  OrderApp
//
//  Created by Oniel Rosario on 9/24/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    var item: MenuItem
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
//                    .cornerRadius(10)
                Text("Photo: \(item.photoCredit)")
                .padding(4)
                    .background(Color.black)
                    .cornerRadius(10)
                    .opacity(0.8)
                    .font(.caption)
                    .foregroundColor(.white)
                .offset(x: -5, y: -5)
            }
            Text(item.description)
            .padding()
            Button("Order this") {
                self.order.add(item: self.item)
            }.font(.headline)
            Spacer()
        }.navigationBarTitle(Text(item.name), displayMode: .inline)
//            .background(C)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        ItemDetail(item: MenuItem.example).environmentObject(order)
    }
}
