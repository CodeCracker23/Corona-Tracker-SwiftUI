//
//  CovidFetchRequest.swift
//  Corona-Tracker
//
//  Created by M. Raşit Öner on 27.07.2020.
//  Copyright © 2020 M. Raşit Öner. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CovidFetchRequest: ObservableObject {
    
    //published will notify when its content change like RSS News
    @Published var allCountryies: [CountryData] = []
    @Published var totalData: TotalData = testTotalData
    
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
        "x-rapidapi-key": "d172e810e7msh47584ae043c146dp12d8eejsnb0b3c42c4a59"
        //a09d5ebcfamshfd96b4f91515794p1e9f17jsncb0cfff0cbbd
    ]
    
    init(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.getCurrentTotal()
        }
        
        getAllCountries()
    }
    
    func getCurrentTotal() {
        
        AF.request("https://covid-19-data.p.rapidapi.com/totals?format=json", headers: headers).responseJSON { response in
            
            let result = response.data
            if result != nil {
                let json = JSON(result!)
                //print(json)
                
                let confirmed = json[0]["confirmed"].intValue
                let deaths = json[0]["deaths"].intValue
                let recovered = json[0]["recovered"].intValue
                let critical = json[0]["critical"].intValue
                
                self.totalData = TotalData(confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered)
                
            } else {
                self.totalData = testTotalData
            }
        }
    }
    
    func getAllCountries() {
        
        AF.request("https://covid-19-data.p.rapidapi.com/country/all", headers: headers).responseJSON { response in
            
            //print(response)
            let result = response.value
            /*clear array when updating it
                so we create an empty array
                everytime when it refreshes
                fill it and send it */
            var allCount: [CountryData] = []
            
            if result != nil {
                
                let dataDictionary = result as! [Dictionary<String, AnyObject>]
                
                for countryData in dataDictionary {
                    
                    let country = countryData["country"] as? String ?? "Error" //nil value gelirse crash olmasin
                    let longitude = countryData["longitude"] as? Double ?? 0.0
                    let latitude = countryData["latitude"] as? Double ?? 0.0
                    
                    let confirmed = countryData["confirmed"] as? Int64 ?? 0
                    let deaths = countryData["deaths"] as? Int64 ?? 0
                    let recovered = countryData["recovered"] as? Int64 ?? 0
                    let critical = countryData["critical"] as? Int64 ?? 0
                    
                    let countryObject = CountryData(country: country, confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered, longitude: longitude, latitude: latitude)
                    
                    allCount.append(countryObject)
                    
                    
                }
                
            }
            
            self.allCountryies = allCount.sorted(by: { $0.confirmed > $1.confirmed }) //sorting by cases
            
        }
    }
}
