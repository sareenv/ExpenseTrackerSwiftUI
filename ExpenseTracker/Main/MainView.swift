//
//  Main.swift
//  ExpenseTracker
//
//  Created by DataBunker on 2022-10-20.
//

import SwiftUI


struct CardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Apple Credit Card")
                .font(Font.system(size: 24, weight: .semibold))
            
            HStack {
                Image("main")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                Spacer()
                Text("Balance: $5,000")
                    .font(Font.system(size: 18))
            }
            
            Text("1234 1234 1234 1234")
            
                .font(Font.system(size: 18))
            Text("Credit Limit: $50,000")
                .font(Font.system(size: 18))
            HStack { Spacer() }
        }
        .foregroundColor(Color.white)
        .padding()
        .background(
            LinearGradient(colors: [.blue.opacity(0.6), .blue], startPoint: .top, endPoint: .bottomTrailing)
        )
        .cornerRadius(8)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

struct MainView: View {
    @State var shouldPresentAddForm = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                TabView {  
                    Group {
                        CardView()
                        CardView()
                        CardView()
                    } .padding(.bottom, 50)
                }
                
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)
                )
                .frame(height: 280)
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
                
                Spacer()
                    .fullScreenCover(isPresented: $shouldPresentAddForm, onDismiss: nil) {
                        Text("add card form")
                    }
                
                
            }.navigationTitle("Home")
                .navigationBarItems(trailing: Button(action: {
                    self.shouldPresentAddForm.toggle()
                    
                }, label: {
                    Text("+Card")
                        .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                        .font(.system(size: 16, weight: .semibold))
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }))
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
