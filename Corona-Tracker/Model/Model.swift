//
//  Model.swift
//  Corona-Tracker
//
//  Created by M. Raşit Öner on 29.07.2020.
//  Copyright © 2020 M. Raşit Öner. All rights reserved.
//

import Foundation

struct TotalData {
    
    let confirmed: Int
    let critical: Int
    let deaths: Int
    let recovered: Int
    
    var fatalityRate: Double {
        return (100.00 * Double(deaths)/Double(confirmed))
    }
    
    var recoveredRate: Double {
        return (100.00 * Double(recovered)/Double(confirmed))
    }
}

struct CountryData {
    
    let country: String
    let confirmed: Int64
    let critical: Int64
    let deaths: Int64
    let recovered: Int64
    let longitude: Double
    let latitude: Double
    
    var fatalityRate: Double {
        return (100.00 * Double(deaths)/Double(confirmed))
    }
    
    var recoveredRate: Double {
        return (100.00 * Double(recovered)/Double(confirmed))
    }
    
    
}

struct DetailedCountryData {
    
    let country: String
    
    let confirmedCases: Int
    let newCases: Int
    
    let recoveredCases: Int
    let criticalCases: Int
    let activeCases: Int
    
    let deaths: Int
    let newDeaths: Int
    
    let testsDone: Int
    
    
    var fatalityRate: Double {
        return (100.00 * Double(deaths)/Double(confirmedCases))
    }
    
    var recoveredRate: Double {
        return (100.00 * Double(recoveredCases)/Double(confirmedCases))
    }
    
    
}


let testTotalData = TotalData(confirmed: 10, critical: 10, deaths: 10, recovered: 10)

let TestCountryData = CountryData(country: "asd", confirmed: 12, critical: 12, deaths: 12, recovered: 12, longitude: 12, latitude: 12)
