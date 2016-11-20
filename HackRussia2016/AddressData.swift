//
//  AddressData.swift
//  HackRussia2016
//
//  Created by Dmitriy on 19/11/2016.
//  Copyright © 2016 Dmitriy. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class AddressData {
    
    var coordinate: CLLocationCoordinate2D
    var food: String
    var comment: String
    
    init?(coordinate: CLLocationCoordinate2D, food: String, comment: String) {

        self.coordinate = coordinate
        self.food = food
        self.comment = comment
        
        if food.isEmpty {
            return nil
        }
    }
    
    
}

