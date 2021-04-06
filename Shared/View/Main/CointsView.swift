//
//  Test.swift
//  EMCD.io
//
//  Created by ALEX on 30.03.21.
//

import SwiftUI

struct CointsView: View {
    @State var label = ["Bitcoin (BTC)", "Bitcoin Cash Node (BCHN)", "Bitcoin SV (BSV)", "LiteCoint (LTC)", "Dash (DASH)", "Etherium (ETH)", "Etherium Classic (ETC)" ]
    @State var currientLabel = "chang coints"
    var body: some View {
        HStack {
            // Other views
            Text(currientLabel)
            
            // Button, that when tapped shows 3 options
            Menu {
                Button(action: {currientLabel = label[0] }) {
                    Label(label[0], image: "BTC_ico")
                }
                Button(action: {currientLabel = label[1]}) {
                    Label(label[1], image: "BCHN_ico")
                }
                Button(action: {currientLabel = label[2]}) {
                    Label(label[2], image: "BSV_ico")
                }
                Button(action: {currientLabel = label[3]}) {
                    Label(label[3], image: "LTC_ico")
                }
                Button(action: {currientLabel = label[4]}) {
                    Label(label[4], image: "DASH_ico")
                }
                Button(action: {currientLabel = label[5]}) {
                    Label(label[5], image: "ETH_ico")
                }
                Button(action: {currientLabel = label[6]}) {
                    Label(label[6], image: "ETC_ico")
                }
                
                
                
                
            } label: {
                Text( "...").foregroundColor(.blue)
                    .font(.system(size: 22))
                    .multilineTextAlignment(.center)
                
            }
            .padding(.bottom)
        }
        
        .frame(width: 350, height: 350)
    }
}



struct Test_Previews: PreviewProvider {
    static var previews: some View {
        CointsView()
    }
}
