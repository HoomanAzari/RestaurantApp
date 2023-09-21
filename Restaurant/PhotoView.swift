//
//  PhotoView.swift
//  Restaurant
//
//  Created by Houman Azari on 2023-09-20.
//

import SwiftUI

struct PhotoView: View {
    
    @Binding var selectedPhoto: String              //binding to the selectedPhoto in gallery view
    @Binding var sheetVisible: Bool
    
    var body: some View {
        
        ZStack{
            Image(selectedPhoto)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack{
                HStack{
                    Spacer()            //pushes the button all the way to right
                    Button {
                        sheetVisible = false
                    } label: {
                        Image(systemName: "x.circle")
                            .scaleEffect(2)
                            .foregroundColor(.black)
                    }
                    .padding()
                }
                Spacer()     //pushes the button all the way up
            }
        }
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(selectedPhoto: Binding.constant("gallery2"),
                  sheetVisible: Binding.constant(true))
    }
}
