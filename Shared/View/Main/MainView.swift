//
//  MainView.swift
//  EMCD.io
//
//  Created by ALEX on 27.03.21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        
        
        ZStack {
            
            VStack {
                
                Image("EMCD_logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Color(red: 101 / 225, green: 90 / 255, blue: 251 / 255)
                    .edgesIgnoringSafeArea(.all)
                
            }
            HStack(alignment: .top, spacing: 50.0) {
            VStack(alignment: .center, spacing: -6.0) {
                Text("Текущий хешрейт")
                    .foregroundColor(.white)
                    .padding(2)
                Text("Etherium (ETH)")
                    .foregroundColor(.white)
                    .padding(10)
                Text("0 Gh/s")
                    .foregroundColor(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                
            }
            
            VStack(alignment: .center, spacing: -6.0) {
                Text("Выплата на сегодня")
                    .foregroundColor(.white)
                    .padding()
                Text("0.00000")
                    .font(.title)
              
        }
        
            }
            .padding(.top, -330.0)
                
                
        }
            
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
