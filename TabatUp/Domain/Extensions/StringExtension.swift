//
//  StringExtension.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 2/11/22.
//

import Foundation

extension String {
    var intValue: Int? {
        get {
            guard let intValue = Int(self) else { return nil }
            return intValue
        }
    }
}
