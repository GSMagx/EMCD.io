//
//  TabView.swift
//  EMCD.io
//
//  Created by ALEX on 31.03.21.
//

import SwiftUI

struct TabMainView: View {
    
    var body: some View {
   //     NavigationView {
            TabView {
                
                MainView()
                    .tabItem { Image(systemName: "house.fill") }
                
                WorkersView()
                    .tabItem { Image(systemName: "display.2") }
                
                PayoutsView()
                    .tabItem { Image(systemName: "creditcard.fill") }
                
                ProfileView()
                    .tabItem { Image(systemName: "person.fill") }
                
               SettingsView()
                    .tabItem { Image(systemName: "gearshape.fill") }
            }
          //  .navigationTitle("Home")
       //     .navigationBarTitleDisplayMode(.inline)
         //   .navigationBarItems(trailing: logoutButton)
 //           .accentColor(.black)
            .edgesIgnoringSafeArea(.all)
        }
        
    }
   


struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabMainView()
    }
}
