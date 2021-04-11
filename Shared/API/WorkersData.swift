//
//  WorkersData.swift
//  EMCD.io
//
//  Created by ALEX on 08.04.21.

//{
//  "total_count": {
//    "all": 0,
//    "active": 0,
//    "inactive": 0,
//    "dead_count": 0
//  },
//  "total_hashrate": {
//    "hashrate": 0,
//    "hashrate1h": 0,
//    "hashrate24h": 0
//  },
//  "details": [],
//  "detailsDead": {}
//}
// https://api.emcd.io/v1/btc/workers/c853c7ec-6954-4dd7-9394-8a70de529adc

import SwiftUI

struct Workers: Codable {
    let total_count: Int
    let all: Int
    let active: Int
    let inactive: Int
    let dead_count: Int
}



struct WorkersData: View {
    @State var workersData = [Workers]()
    var body: some View {
        HStack {
  
            //    List{
            if workersData.isEmpty {
                Text("Пусто")
            } else {
                
                Text(String(workersData[0].dead_count))
            }
            //  }
        }
        .onAppear(perform: loadData)
        
    }

    func loadData() {
        guard let url = URL(string: "https://api.emcd.io/v1/eth/workers/c853c7ec-6954-4dd7-9394-8a70de529adc") else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            let workers = try? JSONDecoder().decode(Workers.self, from: data)
            if let workers = workers {
                DispatchQueue.main.async {
                workersData.append(workers)
                }
            } else {
                print("тишина")
            }
            
        }.resume()
    }
    
}


struct WorkersData_Previews: PreviewProvider {
    static var previews: some View {
        WorkersData()
    }
}
