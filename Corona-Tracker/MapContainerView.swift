//
//  MapContainerView.swift
//  Corona-Tracker
//
//  Created by M. Raşit Öner on 30.07.2020.
//  Copyright © 2020 M. Raşit Öner. All rights reserved.
//

import SwiftUI

struct MapContainerView: View {
    
    @ObservedObject var covidFetch = CovidFetchRequest()
    
    var body: some View {
        
        MapView(countryData: $covidFetch.allCountryies)
    }
}

struct MapContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MapContainerView()
    }
}
