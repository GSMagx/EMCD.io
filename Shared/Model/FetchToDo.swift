//
//  FetchToDo.swift
//  EMCD.io
//
//  Created by ALEX on 12.04.21.
//

import Foundation

class FetchToDo: ObservableObject {
  // 1.
  @Published var todos = [Todo]()
     
    init() {
        guard  let url = URL(string: "https://api.emcd.io/v1/eth/workers/c853c7ec-6954-4dd7-9394-8a70de529adc") else { return }
        // 2.
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    // 3.
                    let decodedData = try JSONDecoder().decode([Todo].self, from: todoData)
                    DispatchQueue.main.async {
                        self.todos = decodedData
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
}
