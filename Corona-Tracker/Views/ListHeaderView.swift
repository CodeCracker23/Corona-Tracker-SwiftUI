//
//  ListHeaderView.swift
//  Corona-Tracker
//
//  Created by M. Raşit Öner on 30.07.2020.
//  Copyright © 2020 M. Raşit Öner. All rights reserved.
//

import SwiftUI

struct ListHeaderView: View {
    var body: some View {
        HStack{
            Text("Country")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(width: 110, alignment: .leading) // leading goes to left side
                .padding(.leading, 15)
            
            Spacer()
            
            Text("Conf.")
            .fontWeight(.bold)
            .font(.subheadline)
            .frame(height: 40) // leading goes to left side
            .padding(.leading, 5)
            
            Spacer()
            
            Text("Death")
            .fontWeight(.bold)
            .font(.subheadline)
            .frame(height: 40) // leading goes to left side
            .padding(.leading, 5)
            
            Spacer()
            
            Text("Recovered")
            .fontWeight(.bold)
            .font(.subheadline)
            .frame(height: 40) // leading goes to left side
            .padding(.trailing, 15)

        }
        .background(Color("cardBackgrundGray"))

    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView()
    }
}
