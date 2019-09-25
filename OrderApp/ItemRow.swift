//
//  ItemRow.swift
//  OrderApp
//
//  Created by Oniel Rosario on 9/24/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    static let colors: [String: Color] = [
        "D": .purple,
        "G": .black,
        "N": .red,
        "S": .blue,
        "V": .green]
    var item: MenuItem
    
    var body: some View {
        NavigationLink(destination: ItemDetail(item: item)) {
        HStack {
            VStack(alignment: .leading) {
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }.layoutPriority(1)
            Spacer()
            
            ForEach(item.restrictions, id: \.self) { restrinction in
                Text(restrinction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(Self.colors[restrinction, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
