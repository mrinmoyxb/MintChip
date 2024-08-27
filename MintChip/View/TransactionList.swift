//
//  TransactionList.swift
//  MintChip
//
//  Created by Mrinmoy Borah on 27/08/24.
//

import SwiftUI

struct TransactionList: View {
    
    @EnvironmentObject var transactionListVM: TransactionsViewModel
    
    var body: some View {
        VStack{
            List{
                ForEach(Array(transactionListVM.groupTransactionByMonth()), id: \.key){month, transactions in
                    Section{
                        ForEach(transactions){transaction in
                            TransactionRow(transaction: transaction)
                        }
                    }header:{
                        Text(month)
                    }
                }
            }.listStyle(.plain)
        }
        .navigationTitle("Transaction")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionList_Previews: PreviewProvider {
    static let transactionVM: TransactionsViewModel = {
        let transactionVM = TransactionsViewModel()
        transactionVM.transactions = transactionPreviewList
        return transactionVM
    }()
    
    static var previews: some View{
        Group{
            NavigationView{
                TransactionList()
            }
            NavigationView{
                TransactionList()
                    .preferredColorScheme(.dark)
            }
        }.environmentObject(transactionVM)
    }
}
