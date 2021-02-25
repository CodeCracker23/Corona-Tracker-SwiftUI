//
//  SearchView.swift
//  Corona-Tracker
//
//  Created by M. Raşit Öner on 30.07.2020.
//  Copyright © 2020 M. Raşit Öner. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchText: String
    var body: some View {
        
        HStack {
            TextField("Country...", text: $searchText)
                .padding()
        }
        .frame(height:50)
        .background(Color("cardBackgrundGray"))
    }
}

