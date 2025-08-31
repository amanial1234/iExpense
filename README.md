# Expense Tracker App

A simple iOS app built with SwiftUI that allows users to track their expenses.  
Expenses are stored and persisted using `UserDefaults` with JSON encoding/decoding.  

## Features

- Add and remove expenses  
- Persist data locally using `UserDefaults`  
- Uses `Codable` for encoding/decoding  
- Displays a list of expenses with support for deletion  

### Saving and Loading Data
Expenses are encoded into JSON and stored in `UserDefaults`.  
On app launch, saved data is decoded back into `[ExpenseItem]`.  

## Code Highlights
https://github.com/user-attachments/assets/ebf02a3c-19e3-41e7-8466-64c73d0ae1c5

