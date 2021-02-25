//
//  CountryStatisticsFetchRequest.swift
//  Corona-Tracker
//
//  Created by M. Raşit Öner on 30.07.2020.
//  Copyright © 2020 M. Raşit Öner. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class CountryStatisticsFetchRequest: ObservableObject {
    
    //published will notify when its content change like RSS News
    @Published var detailedCountryData: DetailedCountryData?
    
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "covid-193.p.rapidapi.com",
        "x-rapidapi-key": "a09d5ebcfamshfd96b4f91515794p1e9f17jsncb0cfff0cbbd"
        //        "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
        //        "x-rapidapi-key": "d172e810e7msh47584ae043c146dp12d8eejsnb0b3c42c4a59"
        //a09d5ebcfamshfd96b4f91515794p1e9f17jsncb0cfff0cbbd
    ]
    
    init(){
    }
    
    func getStatsFor(country: String) {
        
        AF.request("https://covid-193.p.rapidapi.com/statistics?country=\(country)", headers: headers).responseJSON { response in
            
            let result = response.data
            if result != nil {
                let json = JSON(result!)
                //                print(json)
                //print(json["response"][0]["cases"])
                
                let country = json["response"][0]["country"].stringValue
                
                let deaths = json["response"][0]["deaths"]["total"].intValue
                let newDeaths = json["response"][0]["deaths"]["new"].intValue
                
                let tests = json["response"][0]["tests"]["total"].intValue
                
                let criticalCases = json["response"][0]["cases"]["critical"].intValue
                let totalCases = json["response"][0]["cases"]["total"].intValue
                let activeCases = json["response"][0]["cases"]["active"].intValue
                let newCases = json["response"][0]["cases"]["new"].intValue
                let recoveredCases = json["response"][0]["cases"]["recovered"].intValue
                
                
                self.detailedCountryData = DetailedCountryData(country: country, confirmedCases: totalCases, newCases: newCases, recoveredCases: recoveredCases, criticalCases: criticalCases, activeCases: activeCases, deaths: deaths, newDeaths: newDeaths, testsDone: tests)
                
            }
        }
    }
    
}


