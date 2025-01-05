//
//  Login.swift
//  Planet Beach
//
//  Created by Ari Yamashita on 12/8/24.
//

import SwiftUI

struct SecureInputView: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text)
                } else {
                    TextField(title, text: $text)
                }
            }.padding(.trailing, 32)

            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
            }
        }
    }
}

struct LoginView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var email: String = ""
    @State var password: String = ""
    @State var receivedAnalysis = false
    @State var parseError = ""
    @Binding var token: String
    @Binding var error: String
    @Binding var isLoggingIn: Bool
    
    var body: some View {
        
        VStack {
            TextField("Email", text: $email)
                .padding()
                
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.accent, lineWidth: 2)
                )
            SecureInputView("Password", text: $password)
                .padding()
                
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.accent, lineWidth: 2))
               
            Button(action: {
                receivedAnalysis = false
         
                    
                    
                    LoginApi().getLogin(password: password, email: email) { (token, parseError) in
                        self.token = token
                        UserDefaults.standard.set(token, forKey: "token")
                        receivedAnalysis = true
                        self.parseError = parseError
                      
                        if parseError == "no error" {
                            
                            isLoggingIn = false
                        }
                        else {
                            self.error = "Could not find your account in the database."
                            
                        }
                       
                    }
                
            }) {
                VStack {
                    HStack {
                        Spacer()
                        Text("Log in")
                        Spacer()
                    }
                    
                }
                .padding()
                .background(
                    Rectangle()
                        .foregroundColor(.accentColor)
                        .opacity(0.3)
                        .cornerRadius(10)
                    
                )
                
            }
            .padding(.top)
        }
        .font(.system(size: 20, design: .rounded))

    }
}

struct SignupView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmedPassword: String = ""
    @State var receivedAnalysis = false
    @State var parseError = ""
    @Binding var token: String
    @Binding var error: String
    @Binding var isLoggingIn: Bool
    
    var body: some View {
        
        VStack {
            TextField("Email", text: $email)
                .padding()
                
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.accent, lineWidth: 2)
                )
            SecureInputView("Password", text: $password)
                .padding()
                
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.accent, lineWidth: 2))
            SecureInputView("Confirm Password", text: $confirmedPassword)
                .padding()
                
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.accent, lineWidth: 2))
               
            Button(action: {
                receivedAnalysis = false
                if password == confirmedPassword {
                    
                    
                    SignupApi().getSignup(password: password, email: email) { (token, parseError) in
                        self.token = token
                        UserDefaults.standard.set(token, forKey: "token")
                        receivedAnalysis = true
                        self.parseError = parseError
                      
                        if parseError == "no error" {
                            
                            isLoggingIn = false
                        }
                        else {
                            self.error = token
                            
                        }
                       
                    }
                }
                else {
                    error = "Password do not match."
                }
            }) {
                VStack {
                    HStack {
                        Spacer()
                        Text("Sign up")
                        Spacer()
                    }
                    
                }
                .padding()
                .background(
                    Rectangle()
                        .foregroundColor(.accentColor)
                        .opacity(0.3)
                        .cornerRadius(10)
                    
                )
                
            }
            .padding(.top)
        }
        .font(.system(size: 20, design: .rounded))

    }
}

struct AuthView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var typeOfLogin = false
    @State var oldToken = UserDefaults.standard.string(forKey: "token")
    @State var token = ""
    @State var error = ""
    @Binding var isLoggingIn: Bool
    @State var isValid = ""
    @State var parseError = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("logo_banner")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.bottom)
                  
                VStack {
                    
                    Spacer()
                    VStack {
                        VStack {
                            HStack {
                                
                                Text("Sign in to Planet Beach")
                                Spacer()
                                
                                Image(systemName: "globe.desk")
                                    .font(.title)
                                    .foregroundColor(.accentColor)
                            }
                            
                            HStack {
                                Button(action: {
                                    typeOfLogin = false
                                }) {
                                    HStack {
                                        Spacer()
                                        Text("Log in")
                                            .animation(nil, value: UUID())
                                        Spacer()
                                    }
                                }
                                .background(
                                    ZStack {
                                    Rectangle()
                                            .fill(!typeOfLogin ? Color.accentColor : Color.clear)

                                    Rectangle()
                                          .offset(y: -4)
                                          .blendMode(.destinationOut)
                                }
                                .frame(height: 50)
                                .compositingGroup()
                                
                                )
                                Button(action: {
                                    typeOfLogin = true
                                }) {
                                    HStack {
                                        Spacer()
                                        Text("Sign up")
                                            .animation(nil, value: UUID())
                                        Spacer()
                                    }
                                }
                                .background(ZStack {
                                    Rectangle()
                                        .fill(
                                            typeOfLogin ? Color.accentColor : Color.clear
                                        )

                                    Rectangle()
                                          .offset(y: -4)
                                          .blendMode(.destinationOut)
                                }
                                .frame(height: 50)
                                .compositingGroup()
                                
                                )
                            }
                            .padding(.vertical)
                            .padding(.bottom)
                            
                            if !typeOfLogin {
                                LoginView(token: $token, error: $error, isLoggingIn: $isLoggingIn)
                            }
                            else {
                                SignupView(token: $token, error: $error, isLoggingIn: $isLoggingIn)
                            }
                            
                            Text(error)
                                .foregroundColor(.red)
                        }
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(colorScheme == .dark ? .black : .white)
                            
                                .cornerRadius(15)
                            
                        )
                        .padding(.horizontal)
                    }
                    
                    .foregroundColor(.primary)
                    
                    Spacer()
                    
                }
                
                
            }
            .font(.system(size: 20, design: .rounded))
            .ignoresSafeArea()
            .animation(nil, value: UUID())
            .onAppear() {
                oldToken = UserDefaults.standard.string(forKey: "token")
                TokenApi().getToken(token: oldToken ?? "") { (isValid, parseError) in
                    self.isValid = isValid
                    self.parseError = parseError
                  print(isValid)
                    if parseError == "no error" && isValid == "true" {
                        isLoggingIn = false
                       
                    }
                    else {
                        
                    }
                    
                }
            }
        }
    }
}

//struct WebView: UIViewRepresentable{
//    
//    var url:String
//    
//    
//    func makeUIView(context: Context) -> some UIView {
//        guard let url = URL(string: url) else {
//            return WKWebView()
//        }
//        let webview = WKWebView()
//        webview.load(URLRequest(url: url))
//        return webview
//    }
//    
//    func updateUIView(_ uiView: UIViewType, context: Context) {
//        
//    }
//}



#Preview {
    MainView()
}
