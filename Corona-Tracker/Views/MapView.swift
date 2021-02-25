//
//  MapView.swift
//  Corona-Tracker
//
//  Created by M. Raşit Öner on 30.07.2020.
//  Copyright © 2020 M. Raşit Öner. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    
    
    @Binding var countryData: [CountryData]
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
            
        var allAnnotations: [CoronaCaseAnnotation] = []
        
        for data in countryData {
            
            let title = data.country + "\n Confirmed " + data.confirmed.formatNumber() + "\n Death " + data.deaths.formatNumber()
            
            let coordinate = CLLocationCoordinate2D(latitude: data.latitude, longitude: data.longitude)
            
            allAnnotations.append(CoronaCaseAnnotation(title: title, coordinate: coordinate))
        }
        
        uiView.annotations.forEach{ uiView.removeAnnotation($0) }
        uiView.addAnnotations(allAnnotations)
        
        
          
    }
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        return MKMapView()
    }

}

class CoronaCaseAnnotation: NSObject, MKAnnotation {
    
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
    
}
