//
//  PreviewData.swift
//  MintChip
//
//  Created by Mrinmoy Borah on 04/05/24.
//

import Foundation
var transactionPreviewData = Transaction(id: 1, date: "04/05/2024", institution: "SBI", account: "Visa SBI", merchant: "Apple", amount: 11.49, type: "debit", categoryId: 001, category: "Software", isPending: false, isTransfer: true, isExpense: true, isEdited: false)

var transactionPreviewList: [Transaction] = [Transaction](repeating: transactionPreviewData, count: 10)
