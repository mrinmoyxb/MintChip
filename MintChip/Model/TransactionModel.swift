//
//  TransactionModel.swift
//  MintChip
//
//  Created by Mrinmoy Borah on 04/05/24.
//

import Foundation
import SwiftUIFontIcon

struct TransactionModel: Identifiable, Codable, Hashable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    let merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    var isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    // date format
    var dateParsed: Date{
        date.dateParsed()
    }
    
    // credit + and debit -
    var signedAmount: Double{
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
    
    var month: String{
        dateParsed.formatted(.dateTime.year().month(.wide))
    }
}

enum TransactionType: String{
    case debit = "debit"
    case credit = "credit"
}

struct Category{
    let id: Int
    let name: String
    let icon: FontAwesomeCode
    var mainCategoryId: Int?
}

extension Category{
    static let autoAndTransport = Category(id: 1, name: "Auto & Transport", icon: .car_alt)
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities", icon: .file_invoice_dollar)
    static let entertainment = Category(id: 3, name: "Entertainment", icon: .file)
}
