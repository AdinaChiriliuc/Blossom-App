//
//  DetailUIView.swift
//  Blossom SwiftUI
//
//  Created by Adina Chiriliuc on 14/08/2020.
//  Copyright © 2020 Adina Chiriliuc. All rights reserved.
//

import SwiftUI

struct DetailUIView: View {
    //   let orders:ContentView
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        VStack {
            Text("Orders")
                .font(.system(size:30))
            NavigationView {
                VStack {
                    List(networkManager.posts) { post in
                        VStack(alignment:.center) {
                            Image("book")
                            Text("ID:")
                                .bold()
                                .foregroundColor(.red)
                                .frame(alignment: .center)
                            Text(post.customer_id)
                            
                            Text("Order Description:")
                                .bold()
                                .foregroundColor(.red)
                            Text(post.description_name)
                            
                            Text("Price:")
                                .bold()
                                .foregroundColor(.red)
                            Text(post.price)
                            
                            Text("Customer Address:")
                                .bold()
                                .foregroundColor(.red)
                            Text(post.customer_address)
                            
                            Spacer()
                            
                        }.frame(width: 380, height:250, alignment: .center)
                        
                    }.environment(\.defaultMinListRowHeight, 200)
                }
                
            }
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}


struct DetailUIView_Previews: PreviewProvider {
    static var previews: some View {
        DetailUIView()
    }
}
