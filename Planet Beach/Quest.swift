//
//  Quest.swift
//  Planet Beach
//
//  Created by Ari Yamashita on 12/8/24.
//

//
//  Account.swift
//  Planet Beach
//
//  Created by Ari Yamashita on 12/8/24.
//

import SwiftUI

struct QuestView: View {
    @Environment(\.colorScheme) var colorScheme
    
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
                        Text("Quests")
                            .font(.title)
                        
                       
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



//
//  Quest.swift
//  Planet Beach
//
//  Created by Ari Yamashita on 12/8/24.
//

//
//  Account.swift
//  Planet Beach
//
//  Created by Ari Yamashita on 12/8/24.
//

import SwiftUI

struct ShopView: View {
    @Environment(\.colorScheme) var colorScheme
    
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
                        Text("Shopping")
                            .font(.title)
                        
                       
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


