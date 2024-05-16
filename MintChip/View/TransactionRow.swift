//
//  TransactionRow.swift
//  MintChip
//
//  Created by Mrinmoy Borah on 04/05/24.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRow: View {
    
    var transaction: Transaction
    
    var body: some View {
        HStack(spacing: 20){
            
            // Rectangle
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.appIcon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay{
                    FontIcon.text(.awesome5Solid(code: .icons), fontsize: 24, color: Color.appIcon)
                }
            
            VStack(alignment: .leading, spacing: 6){
                
                // Transaction merchant
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                // Transaction Category
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                // Transaction Date
                Text(transaction.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(transaction.signedAmount, format: .currency(code: "USD"))
                .bold()
                .foregroundColor(transaction.type == TransactionType.credit.rawValue ? Color.appText: .primary)
            
        }
        .padding([.top, .bottom], 8)
        .padding(.horizontal, 8)
    }
}

#Preview {
    TransactionRow(transaction: transactionPreviewList[0])
}
