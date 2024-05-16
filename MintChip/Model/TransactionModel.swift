//
//  TransactionModel.swift
//  MintChip
//
//  Created by Mrinmoy Borah on 04/05/24.
//

import Foundation

// Data Modal

//* Identifiable: Identifiable protocol is used to ensure that each item in a collection has a unique identifier. This identifier helps distinguish individual items from one another

struct TransactionModel: Identifiable, Codable {
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
}

enum TransactionType: String{
    case debit = "debit"
    case credit = "credit"
}
