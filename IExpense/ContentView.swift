//
//  ContentView.swift
//  IExpense
//
//  Created by Aman Abraham on 8/31/25.
//

import SwiftUI


struct ExpenseItem : Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses{
    var items = [ExpenseItem]() {
        didSet{
            if let encoder = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoder, forKey: "Items")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decoder = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decoder
                return
            }
        }
        items = []
    }
    
}

struct ContentView: View {
    
    @State private var expenses = Expenses()
    
    @State private var showExpense = false
    
    var body: some View {
        NavigationStack{
            VStack {
                List{
                    ForEach(expenses.items) { item in
                        HStack{
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            Text(item.amount, format: .currency(code: "USD"))
                        }
                    }
                    .onDelete(perform: removeItem)
                }
            }
            .navigationTitle("iExpense")
            .toolbar{
                Button("Add Expense", systemImage: "plus") {
                    showExpense = true
                }
                .sheet(isPresented: $showExpense){
                    AddView(expenses: expenses)
                }
            }
        }
    }
    
    func removeItem(at offset: IndexSet){
        expenses.items.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
