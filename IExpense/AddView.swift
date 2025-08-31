//
//  AddView.swift
//  IExpense
//
//  Created by Aman Abraham on 8/31/25.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 5.0
    
    var expenses: Expenses
    
    let types = ["Business", "Personal"]
    var body: some View {
        NavigationStack{
            Form{
                TextField("Enter name", text: $name)
                
                Picker("Pick Type", selection: $type){
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add a new Expense")
            .toolbar{
                Button("Save Expense"){
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
