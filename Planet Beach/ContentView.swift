//
//  ContentView.swift
//  Planet Beach
//
//  Created by Ari Yamashita on 12/8/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var token = UserDefaults.standard.string(forKey: "token")
    @Binding var isLoggingIn: Bool
    @State var showCamera = false
    @State var capturedImage: UIImage?
    @State var trash: String = ""
    @State var parseError = "no error"
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    
                    HStack {
                        Image(systemName: "trophy.fill")
                        Image(systemName: "globe.americas.fill")
                        Spacer()
                        NavigationLink(destination: AccountView(isLoggingIn: $isLoggingIn)) {
                            Image(systemName: "person.crop.circle.fill")
                        }
                    }
                    .font(.title)
                    .foregroundColor(.accentColor)
                    .padding(30)
                    .padding(.top, 30)
                    .padding(.bottom, -15)
                    .background(
                        Rectangle()
                            .foregroundColor(.accentColor)
                            .opacity(0.07)
                    )
                    
                    ScrollView {
                        VStack {
                            Text("Trash picked up today worldwide")
                            Text("18")
                                .font(.system(size: 80, weight: .bold, design: .rounded))
                            
                                .foregroundColor(.accentColor)
                        }
                        .padding(.top, 40)
                        
                        Text("My chapters")
                            .padding(.top, -30)
                            .padding(.bottom, -5)
                        NavigationLink(destination: ChapterView())
                        {
                            VStack {
                                HStack {
                                    
                                    Text("Seattle chapter")
                                    Spacer()
                                    Text("853")
                                        .bold()
                                    Image(systemName: "person.fill")
                                }
                                Image("seattle_beach")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 200)
                                    .clipped()
                                    .cornerRadius(15)
                                
                            }
                            .padding()
                            .background(
                                Rectangle()
                                    .foregroundColor(.orange)
                                    .cornerRadius(15)
                                    .opacity(0.3)
                            )
                            .padding(.horizontal)
                        }
                       
                        .foregroundColor(.primary)
                        HStack {
                            Button(action: {
                                
                            }) {
                                VStack {
                                    HStack {
                                        Text("Join a chapter")
                                        Image(systemName: "plus")
                                    }
                                    
                                }
                                .padding()
                                .background(
                                    Rectangle()
                                        .foregroundColor(.orange)
                                        .cornerRadius(15)
                                        .opacity(0.3)
                                )
                                .padding(.horizontal)
                            }
                            .foregroundColor(.primary)
                        }
                        .padding(.top, 5)
                        
                        Text("My stats")
                            .padding(.top, 30)
                        Grid {
                            GridRow {
                                VStack {
                                    HStack {
                                        
                                        
                                        Image(systemName: "sparkle")
                                            .foregroundColor(.purple)
                                        Text("2,500 power")
                                    }
                                    
                                }
                                .padding()
                                .background(
                                    Rectangle()
                                        .foregroundColor(.primary)
                                        .cornerRadius(15)
                                        .opacity(0.07)
                                )
                                .padding(.horizontal)
                                
                                VStack {
                                    HStack {
                                        
                                        Image(systemName: "rosette")
                                            .foregroundColor(.yellow)
                                        Text("50 tokens")
                                    }
                                    
                                }
                                .padding()
                                .background(
                                    Rectangle()
                                        .foregroundColor(.primary)
                                        .cornerRadius(15)
                                        .opacity(0.07)
                                )
                                .padding(.horizontal)
                                
                            }
                            GridRow {
                                VStack {
                                    HStack {
                                        
                                        
                                        Image(systemName: "water.waves")
                                            .foregroundColor(.cyan)
                                        Text("73 trash picked up")
                                    }
                                    
                                }
                                .padding()
                                .background(
                                    Rectangle()
                                        .foregroundColor(.primary)
                                        .cornerRadius(15)
                                        .opacity(0.07)
                                )
                                .padding(.horizontal)
                                
                                VStack {
                                    HStack {
                                        
                                        Text("3")
                                            .font(.system(size: 20, weight: .bold, design: .rounded))
                                        
                                        Text("Leaderboard position")
                                    }
                                    
                                }
                                .padding()
                                .background(
                                    Rectangle()
                                        .foregroundColor(.primary)
                                        .cornerRadius(15)
                                        .opacity(0.07)
                                )
                                .padding(.horizontal)
                                
                            }
                        }
                        .font(.system(size: 17))
                        .padding(.bottom, 150)
                    }
                    .padding(.top, -10)
                }
                
                
                
                
                ZStack {
                    VStack {
                        Spacer()
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? .black : .white)
                            .frame(height: 80)
                    }
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            NavigationLink(destination: QuestView()){
                                Image(systemName: "scroll.fill")
                                    .foregroundColor(.primary)
                            }
                            Spacer()
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 100, height: 40)
                            
                            
                            
                            Spacer()
                            NavigationLink(destination: ShopView()){
                                Image(systemName: "cart.fill")
                                    .foregroundColor(.primary)
                            }
                            Spacer()
                            
                        }
                        .padding(.bottom, 10)
                        .font(.title)
                        .padding(.bottom, 30)
                        .padding(15)
                        .background(
                            Rectangle()
                                .foregroundColor(.orange)
                                .opacity(0.3)
                            
                        )
                        
                    }
               
                    VStack {
                        Spacer()
                        VStack {
//                            if let image = capturedImage {
//                                Image(uiImage: image)
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(height: 300)
//                            } else {
//                                Text("No Image Captured")
//                                    .font(.headline)
//                                    .foregroundColor(.gray)
//                            }
                            
//                            Button(action: {
//                                showCamera = true
//                            }) {
//                                Text("Open Camera")
//                                    .padding()
//                                    .background(Color.blue)
//                                    .foregroundColor(.white)
//                                    .cornerRadius(10)
//                            }
//                            .padding()
//                            .sheet(isPresented: $showCamera) {
//                                CameraView(isShown: $showCamera, image: $capturedImage)
//                            }
                        }
                        .padding()
                        HStack {
                            Spacer()
                            Button(action: {
                                showCamera = true
                            }) {
                                Image(systemName: "camera.fill")
                                    .font(.system(size: 40))
                                    .padding(25)
                                    .background(
                                        Circle()
                                            .foregroundColor(.orange)
                                            .opacity(1)
                                            .shadow(radius: 10)
                                    )
                            }
                            .sheet(isPresented: $showCamera) {
                                CameraView(isShown: $showCamera, image: $capturedImage)
                            }
                            Spacer()
                        }
                        .foregroundColor(.primary)
                        
                    }
                    .padding(.bottom, 30)
                }
               
                
                
                
                if capturedImage != nil {
                    CameraResultsView(image: $capturedImage)
                        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.25)))
                }
            }
            .font(.system(size: 20, design: .rounded))
            .ignoresSafeArea()
            .onAppear() {
                TrashApi().getNewsArticle() { (trash, parseError) in
                    self.trash = trash
                  
                
                    self.parseError = parseError
                  
                    if parseError == "no error" {
                        
                      
                    }
                    else {
                     
                        
                    }
                   
                }
            }
        }
    }
}

#Preview {
    MainView()
}
