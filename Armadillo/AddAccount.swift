//
//  AddAccount.swift
//  Armadillo
//
//  Created by stephan rollins on 2/5/20.
//  Copyright © 2020 OmniStack. All rights reserved.
//

import SwiftUI

struct AddAccount: View {
    
    @Binding var isPresented: Bool
    
    @State var account = ""
    @State var email = ""
    @State var username = ""
    @State var pw = ""
    @State var vpw = ""
    
    var didAddAccount: (Account) -> ()
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Website")
                TextField("Enter website", text: $account)
            }
            
            HStack {
                Text("Email")
                TextField("Enter email", text: $email)
            }

            HStack {
                Text("Username")
                TextField("Enter username", text: $username)
            }
            
            HStack {
                Text("Password")
                TextField("Enter password", text: $pw)
            }
            
            HStack {
                Text("Confirm password")
                TextField("Confirm password", text: $vpw)
            }
            
            Button(action: {
                //create new account
                self.didAddAccount(Account(id: UUID(), account: self.account, username: self.username, email: self.email, pw: self.pw, created: Date().timeIntervalSince1970))
                self.isPresented.toggle()
            }, label: {
                Text("Create")
            })
            
            Button(action: {
                self.isPresented = false
            }, label: {
                Text("Cancel")
                })
            
            Spacer()
          Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }.padding(.all, 16)
    }
}



//struct AddAccount_Previews: PreviewProvider {
//    static var previews: some View {
//        AddAccount(isPresented: self.isPresented)
//    }
//}





























