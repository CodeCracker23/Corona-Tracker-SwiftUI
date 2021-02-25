//
//  TotalDataView.swift
//  Corona-Tracker
//
//  Created by M. Raşit Öner on 30.07.2020.
//  Copyright © 2020 M. Raşit Öner. All rights reserved.
//

import SwiftUI

struct TotalDataView: View {
    
    var totalData: TotalData
    
    var body: some View {
        VStack{
            
            HStack{
                TotalDataCard(number: totalData.confirmed.formatNumber(), name: "Confirmed")
                
                TotalDataCard(number: totalData.critical.formatNumber(), name: "Critical",color: .yellow)
                
                TotalDataCard(number: totalData.deaths.formatNumber(), name: "Death", color: .red)
                
            }
            
            HStack{
                TotalDataCard(number: String(format: "%.2f", totalData.fatalityRate), name: "Death %")
                
                TotalDataCard(number: totalData.recovered.formatNumber(), name: "Recovered",color: .green)
                
                TotalDataCard(number: String(format: "%.2f", totalData.recoveredRate), name: "Recovery %", color: .red)
                
            }

        } //end of vstack
        .frame(height: 170)
        .padding(10)
    }
}

struct TotalDataView_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataView(totalData: testTotalData)
    }
}
