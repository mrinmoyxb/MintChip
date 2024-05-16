//
//  TransactionViewModel.swift
//  MintChip
//
//  Created by Mrinmoy Borah on 04/05/24.
//

import Foundation
final class TransactionsViewModel: ObservableObject{
    
    @Published var transactions: [TransactionModel] = [TransactionModel]()
    @Published var errorMessage: String?
    private let urlString = "https://designcode.io/data/transactions.json"
    
    init(){
        Task{
            do{
                self.transactions = try await getTransactions()
            }catch{
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    
    // Function to fetch data from API
    func getTransactions() async throws -> [TransactionModel]{
        
        //1. Attempt to create a URL object from the urlString
        guard let url = URL(string: urlString) else{
            throw URLError(.badURL)
        }
        
        //2. Fetches data from the URL using asynchronous operations
        // data: store the downloaded data from the URL
        // response: variable will store the HTTP response received from the server
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
            dump(response)
            return []
        }
        
        //3. It is used to decode JSON data, convert JSON data -> Transaction
        let transactionsData = try JSONDecoder().decode([TransactionModel].self, from: data)
        return transactionsData
    }
    
}
