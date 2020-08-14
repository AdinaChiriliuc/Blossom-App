//
//  ContentView.swift
//  Blossom SwiftUI
//
//  Created by Adina Chiriliuc on 14/08/2020.
//  Copyright © 2020 Adina Chiriliuc. All rights reserved.
//

import SwiftUI
struct ContentView: View {
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        VStack {
            
            NavigationView {
                List(networkManager.posts) { post in
                    
                    NavigationLink(destination: DetailUIView() ) {
                        HStack(alignment: .center, spacing: 20) {
                            Image("branch")
                            Text("ID:")
                            Text(post.customer_id)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text("Customer Name")
                            Text(post.customer_name)
                                .font(.subheadline)
                                .foregroundColor(.white)
                            
                            
                        }
                        
                    }
                }
                .background(
                    Image("Background")
                        .resizable()
                        .frame(width: 900, height: 900)
                        .overlay(Rectangle()
                            .foregroundColor(.black))
                        .opacity(0.4)
                    
                )
                    
                    .navigationBarTitle("Orders")
            }
            .onAppear {
                self.networkManager.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




