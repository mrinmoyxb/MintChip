//
//  TransactionModel.swift
//  MintChip
//
//  Created by Mrinmoy Borah on 04/05/24.
//

import Foundation

struct Transaction: Identifiable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    let merchnat: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    var isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
}

enum TransactionType: String{
    case debit = "debit"
    case credit = "credit"
}
