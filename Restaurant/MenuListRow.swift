//
//  MenuListRow.swift
//  Menu
//
//  Created by Houman Azari on 2023-09-06.
//

import SwiftUI

struct MenuListRow: View {
    
    var item: MenuItem
    var body: some View {
        HStack{
            Image(item.imageName)
                .resizable()            //gives the ability to shrink and grow
                .aspectRatio(contentMode: .fit)             //fits it into the space that specify
                .frame(height: 50)          //specifies the max height of the image
                .cornerRadius(10)           //rounds the corners
            
            Text(item.name)
                .bold()
            
            Spacer()
            Text("$" + item.price)
        }
    }
    
    struct MenuListRow_Previews: PreviewProvider {
        static var previews: some View {
            MenuListRow(item: MenuItem(name: "Test Item", price: "$3.99", imageName: "tako-sushi"))
        }
    }
}
