//
//  AddCardView.swift
//  ExpenseTracker
//
//  Created by DataBunker on 2022-10-21.
//

import SwiftUI

struct AddCardView: View  {
    @Environment(\.presentationMode) var shouldPresentAddForm
    @State var name: String = ""
    @State var cardNumber: String = ""
    @State var limit: String = ""
    @State var cardType: Int = 0
    @State var expiryYear = Calendar.current.component(.year, from: Date())
    @State var expiryMonth = "1"
    @State var tempraroryHolder = ""
    @State var color = Color.blue
    
    let currentDate = Calendar.current.component(.year, from: Date())
    
    var body: some View {
            NavigationView {
               
                    Form {
                        Section("Card Information") {
                            TextField("Name", text: $name)
                                .autocorrectionDisabled()
                            TextField("Credit Card", text: $cardNumber)
                                .keyboardType(.numberPad)
                            TextField("Credit Limit", text: $limit)
                                .keyboardType(.numberPad)
                            
                            // fix the issues with the pickers. - important and needs to taken into consideration otherwise the states the numbers.
                            Picker("Type", selection: $cardType) {
                                Text("Visa").tag(0)
                                Text("Master").tag(1)
                                Text("Discover").tag(2)
                            }
                        }
                        Section(header: Text("Expiration")) {
                            Picker("Year", selection:$expiryYear) {
                                ForEach(currentDate..<currentDate + 20, id: \.self) { value in
                                    Text(String(value))
                                        .tag(String(value))
                                }
                            }
                            
                            Picker("Month", selection:$expiryMonth) {
                                ForEach(1..<13, id: \.self) { value in
                                    Text(String(value))
                                        .tag(String(value))
                                }
                            }
                        }
                        
                        
                        Section(header: Text("Color")) {
                            ColorPicker("Color", selection: $color)
                        }
                        
                    }
                    .navigationTitle("Add Credit Card")
                    .navigationBarItems(leading: Button("Cancel", action: {
                            shouldPresentAddForm.wrappedValue.dismiss()
                    }))
                    .navigationBarItems(trailing: Button(action: {
                        
                    }, label: {
                        Text("Save")
                            .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }))
                Spacer()
                
            }
    }
}
