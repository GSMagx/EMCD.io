//
//  PayoutData.swift
//  EMCD.io
//
//  Created by ALEX on 07.04.21.
//
//{
//  "username": "GSMag",
//  "bitcoin": {
//    "balance": 0,
//    "total_paid": 0,
//    "address": null,
//    "min_payout": 0
//  },
//  "litecoin": {
//    "balance": 0,
//    "total_paid": 0,
//    "address": null,
//    "min_payout": 0
//  },
//  "bitcoin_cash": {
//    "balance": 0,
//    "total_paid": 0,
//    "address": null,
//    "min_payout": 0
//  },
//  "bitcoin_sv": {
//    "balance": 0,
//    "total_paid": 0,
//    "address": null,
//    "min_payout": 0
//  },
//  "dash": {
//    "balance": 0,
//    "total_paid": 0,
//    "address": null,
//    "min_payout": 0
//  },
//  "eth": {
//    "balance": 0.07676459,
//    "total_paid": 5.59595634,
//    "address": "0x3fb31afeba9f7c34be7f0fa6fdb4d7872af0a20c",
//    "min_payout": 0.1
//  },
//  "etc": {
//    "balance": 0,
//    "total_paid": 0,
//    "address": null,
//    "min_payout": 0.1
//  },
//  "notifications": {
//    "email": 1,
//    "telegram": 1
//  }
//}
import SwiftUI
struct Profile: Codable {
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

struct ProfileData: View {

    @State var profileData = [Profile]()
    
    var body: some View {
        
        HStack {
  
            //    List{
            if profileData.isEmpty {
                Text("Пусто")
            } else {
                
         Text(String(profileData[0].username))
            }
            //  }
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
            let payots = try? JSONDecoder().decode(Profile.self, from: data)
            if let payots = payots {
                DispatchQueue.main.async {
                profileData.append(payots)
                print(payots)
                }
            } else {
                print("тишина")
            }
            
        }.resume()
    }
    
}


struct PayoutData: View {
    var body: some View {
        ProfileData()
    }
}
