//
//  Extensions.swift
//  MintChip
//
//  Created by Mrinmoy Borah on 04/05/24.
//

import Foundation
import SwiftUI

extension Color {
    static let appBackground = Color("Background")
    static let appIcon = Color("Icon")
    static let appText = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
}


extension DateFormatter{
    static let allNumeric: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        
        return formatter
    }()
}

extension String{
    func dateParsed() -> Date{
        guard let parsedDate = DateFormatter.allNumeric.date(from: self) else {return Date()}
        return parsedDate
    }
}
