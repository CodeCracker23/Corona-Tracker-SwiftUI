//
//  CountryDetailView.swift
//  Corona-Tracker
//
//  Created by M. Raşit Öner on 30.07.2020.
//  Copyright © 2020 M. Raşit Öner. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    
    @ObservedObject var countryStatisticsRequest = CountryStatisticsFetchRequest()
    
    var countryName: String
    
    var body: some View {
       
        VStack {
            VStack{
                CountryDetailRow(label: "Confirmed", num: countryStatisticsRequest.detailedCountryData?.confirmedCases.formatNumber() ?? "Err")
                    .padding(.top)
                
                CountryDetailRow(label: "Active Cases", num: countryStatisticsRequest.detailedCountryData?.activeCases.formatNumber() ?? "Err")
                
                CountryDetailRow(label: "New Cases", num: "+" + (countryStatisticsRequest.detailedCountryData?.newCases.formatNumber() ?? "Err"))
                
                CountryDetailRow(label: "Recovered Cases", num: countryStatisticsRequest.detailedCountryData?.recoveredCases.formatNumber() ?? "Err", color: .green)
                
                CountryDetailRow(label: "Critical Cases", num: countryStatisticsRequest.detailedCountryData?.criticalCases.formatNumber() ?? "Err", color: .yellow)
                
                CountryDetailRow(label: "Deaths", num: countryStatisticsRequest.detailedCountryData?.deaths.formatNumber() ?? "Err", color: .red)
                
                CountryDetailRow(label: "New Deaths", num: "+" + (countryStatisticsRequest.detailedCountryData?.newDeaths.formatNumber() ?? "Err"), color: .red)
                
                CountryDetailRow(label: "Tests", num: countryStatisticsRequest.detailedCountryData?.testsDone.formatNumber() ?? "Err", color: .blue)
                
                CountryDetailRow(label: "Fatality Rate", num: String(format: "%.2f", countryStatisticsRequest.detailedCountryData?.fatalityRate ?? 0.0) + "%" , color: .red)
                
                CountryDetailRow(label: "Recovery Rate", num: String(format: "%.2f", countryStatisticsRequest.detailedCountryData?.recoveredRate ?? 0.0) + "%" , color: .green)
                
                
                
                
                
            }//end of nested stack
                .background(Color("cardBackgrundGray"))
                .cornerRadius(8)
                .padding()
            
            Spacer()
        }//end of outer stack
            .padding(.top, 25)
            .navigationBarTitle(countryName)
            .onAppear() {
                self.getStatistics()
            }
        
        
    }
    
    private func getStatistics() {
        countryStatisticsRequest.getStatsFor(country: self.countryName.replacingOccurrences(of: " ", with: "-"))
    }
}



struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(countryName: "USD")
    }
}
