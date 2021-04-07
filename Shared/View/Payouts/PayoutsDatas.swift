//
//  PayoutsView.swift
//  EMCD.io
//
//  Created by ALEX on 31.03.21.
//

import SwiftUI
import Foundation



struct Payouts: Decodable {
    var id = UUID()
    let username: String
    let bitcoin, litecoin, bitcoinCash, bitcoinSv: Bitcoin
    let dash, eth, etc: Bitcoin
    let notifications: Notifications
    

    enum CodingKeys: String, CodingKey {
        case username, bitcoin, litecoin, id
        case bitcoinCash
        case bitcoinSv
        case dash, eth, etc, notifications
    }
}

// MARK: - Bitcoin
struct Bitcoin: Decodable {
    let balance, totalPaid: Double
    let address: String?
    let minPayout: Double

    enum CodingKeys: String, CodingKey {
        case balance
        case totalPaid
        case address
        case minPayout
    }
}

// MARK: - Notifications
struct Notifications: Codable {
    let email, telegram: Int
}
   
struct PayoutsView: View {
    @State var payoutsData = [Payouts]()
    var body: some View {
        List{
            ForEach(payoutsData, id: \.id) { item in
                VStack(alignment: .leading){
                    Text(item.username)
                       
                }
            }
        }
        .onAppear(perform: loadData)
    }
    


func loadData() {
        guard let url = URL(string: "https://api.emcd.io/v1/info/c853c7ec-6954-4dd7-9394-8a70de529adc") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                //pull out the declaration of the decoder object
                let decoder = JSONDecoder()
                //set how we want to interpret dates in the JSON
                decoder.dateDecodingStrategy = .iso8601
                //decode directly to an array of User structs rather than a Response
                if let decodedResponse = try?
                    decoder.decode([Payouts].self, from: data) {
                    DispatchQueue.main.async {
                        //decodedResponse is now [User] rather than Response.User
                        self.payoutsData = decodedResponse
                        
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
