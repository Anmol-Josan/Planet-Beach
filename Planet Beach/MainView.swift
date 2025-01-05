//
//  MainView.swift
//  Planet Beach
//
//  Created by Ari Yamashita on 12/8/24.
//

import SwiftUI

struct MainView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var isLoggingIn = true
    
    var body: some View {
        if isLoggingIn {
            AuthView(isLoggingIn: $isLoggingIn)
        }
        else {
            ContentView(isLoggingIn: $isLoggingIn)
        }
    }
}
