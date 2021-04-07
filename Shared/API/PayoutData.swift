//
//  PayoutData.swift
//  EMCD.io
//
//  Created by ALEX on 07.04.21.
//

import SwiftUI
struct Payouts: Codable {
  let username: String
  let bitcoin: Bitcoin
  let litecoin: Bitcoin
  let bitcoin_cash: Bitcoin
  let bitcoin_sv: Bitcoin
  let dash: Bitcoin
  let eth: Bitcoin
  let etc: Bitcoin
  let notifications: Notifications
  
}

// MARK: -
struct Bitcoin: Codable {
  let balance: Double
  let total_paid: Double
  let address: String?
  let min_payout: Double
}

// MARK: - Notifications
struct Notifications: Codable {
  let email, telegram: Int
}

struct PayoutsData: View {
  @State var payoutsData = [Payouts]()
  var body: some View {
    List{
      if payoutsData.isEmpty {
        Text("Пусто")
      } else {
        Text(String(payoutsData[0].eth.balance))
            
        
      }
        
    }
    .onAppear(perform: loadData)

  }
  
  
  func loadData() {
    guard let url = URL(string: "https://api.emcd.io/v1/info/c853c7ec-6954-4dd7-9394-8a70de529adc") else {
      return
    }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard let data = data, error == nil else {
        return
      }
      let payots = try? JSONDecoder().decode(Payouts.self, from: data)
      if let payots = payots {
        payoutsData.append(payots)
        print(payots)
      } else {
        print("тишина")
      }
      
    }.resume()
  }
  
}


struct PayoutData: View {
  var body: some View {
    PayoutsData()
  }
}
