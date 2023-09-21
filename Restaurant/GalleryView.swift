//
//  GalleryView.swift
//  Restaurant
//
//  Created by Houman Azari on 2023-09-18.
//

import SwiftUI

struct GalleryView: View {
    
    @State var sheetVisible = false                 //boolean that tells you if the sheet is there or not
    @State var photoData = [String]() //empty string array initially
    @State var selectedPhoto = ""            //used for our selected image for the sheet
    var dataService = DataService()

    
    var body: some View {
        
        VStack (alignment: .leading) {
            Text("Gallery")
                .font(.largeTitle) 
                .bold()
            
            GeometryReader { proxy in
                
                ScrollView (showsIndicators: false){
                    LazyVGrid(columns: [GridItem(spacing: 10),
                                        GridItem(spacing: 10),
                                        GridItem(spacing: 10)], spacing:10) {
                        ForEach(photoData, id: \.self) { photo in
                            Image(photo)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: (proxy.size.width - 20)/3)
                                //-20 because we have two spacings of 10 each between each column
                                //divide by 3 because we have 3 columns
                                .clipped()
                                .onTapGesture {
                                    selectedPhoto = photo
                                    sheetVisible = true
                                }
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 10)
        .onAppear {
            photoData = dataService.getPhotos()
        }
        .sheet(isPresented: $sheetVisible) {
            PhotoView(selectedPhoto: $selectedPhoto,      //binding the selectedPhoto in the two views together
                      sheetVisible: $sheetVisible)        
        }
    }
}


struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
