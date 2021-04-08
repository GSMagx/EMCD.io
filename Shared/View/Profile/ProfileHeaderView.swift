//
//  ProfileView.swift
//  EMCD.io
//
//  Created by ALEX on 30.03.21.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    var body: some View {
        
        
        VStack(alignment: .leading ) {
            HStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                
                Spacer()
                
                
            }
                 ProfileData()
                
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
            Text("Gotham's Dark Knight | Billionaire ")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)
            
            HStack {
                Spacer()
                //   ProfileActionButtonView()
                Spacer()
            }.padding(.top)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
