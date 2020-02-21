//
//  ContentView.swift
//  Armadillo
//
//  Created by stephan rollins on 2/16/20.
//  Copyright © 2020 OmniStack. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var accounts = [Account]()
    @State var showingSettings = false
    @State var showingAddAccount = false
    
    
    var body: some View {
        //Text("Hello, World!")

        NavigationView{
            VStack{
                List{
                    ForEach(accounts, id: \.id){ item in
                        ZStack{
                            //Text(item.username).padding()
                            Rectangle().fill(Color.white).cornerRadius(10).shadow(color: .gray, radius: 5, x: 1, y: 1)
                            
                            HStack{
                                Image(systemName: "photo").resizable().frame(width: 32, height: 32)

                                VStack(alignment: .leading){
                                    HStack{
                                        Text(item.account).bold().foregroundColor(.blue)
                                        Spacer()
                                        Text(String(item.created)).bold().foregroundColor(.blue)
                                    }
                                    Spacer()
                                    HStack {
                                        Text(item.username).bold().foregroundColor(.blue)
                                        Spacer()
                                        Text(item.email).bold().foregroundColor(.blue)
                                        //Text(item.pw).bold().foregroundColor(.blue)
                                    }
                                    
                                    Spacer()
                                    HStack {
                                        //Text(item.email).bold().foregroundColor(.blue)
                                        //Spacer()
                                        Text(item.pw).bold().foregroundColor(.blue)
                                    }
                                }
                            }.padding()
                        }
                        
                    }.onDelete(perform: delete)
                    .listRowBackground(Color.blue)
                    
                }
            }
            .navigationBarTitle(Text("Keys"))
            .navigationBarItems(leading: Button(action: {
                self.showingSettings.toggle()
                }){
                    Image(systemName: "person.circle").resizable().frame(width: 25, height: 25).shadow(color: .gray, radius: 5, x: 1, y: 1)
            }.accentColor(.white)
            .sheet(isPresented: $showingSettings){
                Settings()
                }
                ,trailing: Button(action: {
                    self.showingAddAccount.toggle()
                    //self.accounts.append(Account(account: "Google", username: "test", email: "email\(self.i)@email.com", pw: "qwertyuiop", created: Date().timeIntervalSince1970))
                    //self.i = self.i + 1
            }){
                Image(systemName: "plus.circle").resizable().frame(width: 25, height: 25).shadow(color: .gray, radius: 5, x: 1, y: 1)
            }.accentColor(.white)
                .sheet(isPresented: $showingAddAccount){
                    AddAccount(isPresented: self.$showingAddAccount, didAddAccount: {
                        account in
                        print(account.username)
                        self.accounts.append(account)

                    })
            })
        }.onAppear{
            //self.getArr()
        }
        
        
    }
    
    func delete(at offsets: IndexSet)
    {
        accounts.remove(atOffsets: offsets)
    }
    
    func getArr()
    {
        if (!self.accounts.isEmpty)
        {
            print("123")
            print(self.accounts.isEmpty)

            //self.accounts = UserDefaults.standard.array(forKey: "Account") as! Data
        }
        else
        {
            print("456")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
