//
//  ChapterView.swift
//  Planet Beach
//
//  Created by Ari Yamashita on 12/8/24.
//

import SwiftUI

struct ChapterView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            
            VStack {
                
                HStack {
                    Spacer()
                    Image(systemName: "line.horizontal.3")
                }
                .font(.title)
                .foregroundColor(.accentColor)
                .padding(30)
                .padding(.top, 30)
                .padding(.bottom, -5)
                .background(
                    Rectangle()
                        .foregroundColor(.accentColor)
                        .opacity(0.07)
                )
                
                ScrollView {
                    VStack {
                        Text("Seattle Chapter")
                            .font(.title)
                        Text("102,500 power")
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                        
                            .foregroundColor(.accentColor)
                        Text("#3 worldwide")
                            .font(.title)
                    }
                    .padding(.top, 20)
                    
                    Text("Map")
                        
                    Image("seattle_beach")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .cornerRadius(15)
                        .padding(.horizontal)
                  
                    HStack {
                        Image(systemName: "laurel.leading")
                            .foregroundColor(.orange)
                            .font(.largeTitle)
                        Text("Chapter leaderboard")
                            
                        Image(systemName: "laurel.trailing")
                            .foregroundColor(.orange)
                            .font(.largeTitle)
                    }
                    .padding(.top, 30)
                    VStack {
                       
                        
                        
                            VStack {
                                HStack {
                                    
                                    
                                    Image(systemName: "trophy.fill")
                                        .foregroundColor(.mint)
                                        .font(.title)
                                    Text("Eli Briggs")
                                    
                                    Spacer()
                                    Text("5,500 power")
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
                                
                                
                                
                                Image(systemName: "trophy.fill")
                                    .foregroundColor(.yellow)
                         
                                    .font(.title)
                                Text("Nikhil Mahesh")
                                
                                Spacer()
                                Text("4,500 power")
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
                                
                                
                                
                                Image(systemName: "trophy.fill")
                                    .foregroundColor(.primary)
                                    .opacity(0.4)
                                    .font(.title)
                                Text("Ari Yamashita")
                                
                                Spacer()
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
                                
                                
                                
                                Image(systemName: "trophy.fill")
                                    .foregroundColor(.brown)
                                    .font(.title)
                                Text("Anmol Josan")
                                
                                Spacer()
                                Text("1,000 power")
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
                        Image(systemName: "scroll.fill")
                        Spacer()
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 100, height: 40)
                        
                        
                        
                        Spacer()
                        Image(systemName: "cart.fill")
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
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            
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
                        Spacer()
                    }
                    .foregroundColor(.primary)
                    
                }
                .padding(.bottom, 30)
            }
           
            }
        .font(.system(size: 20, design: .rounded))
        .ignoresSafeArea()
    }
}

#Preview {
    MainView()
}
