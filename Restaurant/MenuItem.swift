//
//  MenuItem.swift
//  Menu
//
//  Created by Houman Azari on 2023-06-21.
//

import Foundation

struct MenuItem: Identifiable {
    var id: UUID = UUID()               //Gives a different ID to each item
    var name:String
    var price:String
    var imageName:String
}
