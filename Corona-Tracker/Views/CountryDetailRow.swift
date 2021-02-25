//
//  CountryDetailRow.swift
//  Corona-Tracker
//
//  Created by M. Raşit Öner on 30.07.2020.
//  Copyright © 2020 M. Raşit Öner. All rights reserved.
//

import SwiftUI

struct CountryDetailRow: View {
    var label: String = "falan:"
    var num: String = "default"
    var color: Color = .primary
    
    var body: some View {
        VStack {
            HStack{
                Text(label)
                    .font(.body)
                    .padding(5)
                    .foregroundColor(self.color)
                Spacer()
                Text(num)
                    .font(.subheadline)
                    .padding(5)
                    .foregroundColor(self.color)
            }//end of HStack
            Divider()
            
            
            
        }//end of VStack
            .padding(.trailing)
            .padding(.leading)
    }
}

struct CountryDetailRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailRow()
    }
}
