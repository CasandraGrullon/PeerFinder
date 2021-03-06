//
//  Date+Extension.swift
//  findYourPeers
//
//  Created by Maitree Bain on 4/21/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import Foundation

extension Date{
    
    func convertToString() -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "EEEE, MM/dd/yyyy"
        
        return dateFormatter.string(from: self)
    }
}
