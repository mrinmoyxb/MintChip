//
//  RecentTransactionList.swift
//  MintChip
//
//  Created by Mrinmoy Borah on 27/08/24.
//

import SwiftUI

struct RecentTransactionList: View {
    
    @EnvironmentObject var transactionListVM: TransactionsViewModel
    
    var body: some View {
        VStack{
            HStack{
                // Header
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                // Header link
                NavigationLink{
                    
                } label: {
                    HStack(spacing: 4){
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }
            }.padding(.top)
            
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id: \.element){index, transaction in
                TransactionRow(transaction: transaction)
                
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x:0, y:5)
    }
}

struct RecentTransactionList_Previews: PreviewProvider{
    static let transactionVM: TransactionsViewModel = {
        let transactionVM = TransactionsViewModel()
        transactionVM.transactions = transactionPreviewList
        return transactionVM
    }()
    
    static var previews: some View{
        RecentTransactionList()
            .environmentObject(transactionVM)
    }
}
