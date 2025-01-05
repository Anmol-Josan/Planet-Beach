//
//  Account.swift
//  Planet Beach
//
//  Created by Ari Yamashita on 12/8/24.
//

import SwiftUI

struct AccountView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var isLoggingIn: Bool
    
    var body: some View {
        ZStack {
            
            VStack {
                
                HStack {
                    Spacer()
                   
                }
                .font(.title)
                .foregroundColor(.accentColor)
                .padding(30)
                .padding(.top, 30)
                .padding(.bottom, 15)
                .background(
                    Rectangle()
                        .foregroundColor(.accentColor)
                        .opacity(0.07)
                )
                
                ScrollView {
                    VStack {
                        Text("Ari Yamashita")
                            .font(.title)
                        Button(action: {
                            UserDefaults.standard.set("", forKey: "token")
                          
                            isLoggingIn = true
                        }) {
                            VStack {
                                HStack {
                                    Text("Log out")
                                    Image(systemName: "person.crop.circle.badge.xmark")
                                        .font(.largeTitle)
                                }
                                
                            }
                            .padding()
                            .background(
                                Rectangle()
                                    .foregroundColor(.red)
                                    .cornerRadius(15)
                                    .opacity(0.3)
                            )
                            .padding(.horizontal)
                        }
                        .foregroundColor(.primary)
                       
                    }
                    .padding(.top, 20)
                    
                   
                }
                .padding(.top, -10)
            }
            
            
            
            
            
           
            }
        .font(.system(size: 20, design: .rounded))
        .ignoresSafeArea()
    }
}

#Preview {
    MainView()
}
