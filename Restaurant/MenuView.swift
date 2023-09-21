//
//  MenuView.swift
//  Restaurant
//
//  Created by Houman Azari on 2023-09-18.
//

import SwiftUI

struct MenuView: View {
    
    @State var menuItems:[MenuItem] = [MenuItem]()               //Updates the view automatically
    var dataService = DataService()
    
    var body: some View {
        
        List(menuItems) { item in
            
            MenuListRow(item: item)

        }
        .listStyle(.plain)
        .onAppear {
            // Call for the data
            menuItems = dataService.getData()
        }
    }
 }

 struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
 }
