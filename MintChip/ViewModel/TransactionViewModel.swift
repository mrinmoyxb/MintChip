//
//  TransactionViewModel.swift
//  MintChip
//
//  Created by Mrinmoy Borah on 04/05/24.
//

import Foundation

typealias TransactionGroup = [String: [TransactionModel]]

final class TransactionsViewModel: ObservableObject{
    
    @Published var transactions: [TransactionModel] = [TransactionModel]()
    @Published var errorMessage: String?
    
    init(){
        Task{
            do{
                let fetchedTransactions = try await getTransactions()
                DispatchQueue.main.async{
                    self.transactions = fetchedTransactions
                }
            }
            catch{
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    
    // Fetch data from API
    func getTransactions() async throws -> [TransactionModel]{
        let urlString = "https://designcode.io/data/transactions.json"
        guard let url = URL(string: urlString) else{
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
            dump(response)
            return []
        }

        let transactionsData = try JSONDecoder().decode([TransactionModel].self, from: data)
        print("Data: \(transactionsData)")
        return transactionsData
    }
    
    
    func groupTransactionByMonth() -> TransactionGroup{
        guard !transactions.isEmpty else {return [:]}
        let groupedTransactions = TransactionGroup(grouping: transactions) { $0.month }
        return groupedTransactions
    }
    
}
