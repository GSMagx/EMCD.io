//
//  PayoutsView.swift
//  EMCD.io
//
//  Created by ALEX on 31.03.21.
//

import SwiftUI
import Foundation
//struct Payout: Decodable {
//
//    var id : String
//    let timestamp: Int
//    let gmtTime: String
//    let amount: Double
//    let txid: String
//}

// MARK: - Welcome

struct Payouts: Codable {
    let payouts: [Payout]
    var id : String
}

// MARK: - Payout
struct Payout: Codable {
    let timestamp: Int
    let gmtTime: String
    let amount: Double
    let txid: String

    enum CodingKeys: String, CodingKey {
        case timestamp
        case gmtTime
        case amount, txid
    }
}

   
struct PayoutsView: View {
    @State var payoutsData = [Payouts]()
    var body: some View {
        List{
            ForEach(payoutsData, id: \.id) { item in
                
                Text(item.id)
                       
                
            }
        }
        .onAppear(perform: loadData)
    }
    


func loadData() {
        guard let url = URL(string: "https://api.emcd.io/v1/eth/payouts/c853c7ec-6954-4dd7-9394-8a70de529adc") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                //pull out the declaration of the decoder object
                let decoder = JSONDecoder()
                //set how we want to interpret dates in the JSON
               // decoder.dateDecodingStrategy = .iso8601
                //decode directly to an array of User structs rather than a Response
                if let decodedResponse = try?
                    decoder.decode([Payouts].self, from: data) {
                    DispatchQueue.main.async {
                        //decodedResponse is now [User] rather than Response.User
                        self.payoutsData = decodedResponse
                        print(decodedResponse)
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")

        }.resume()
    }

}
struct PayoutsView_Previews: PreviewProvider {
    static var previews: some View {
        PayoutsView()
    }
}
