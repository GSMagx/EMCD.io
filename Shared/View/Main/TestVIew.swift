//
//  TestVIew.swift
//  EMCD.io
//
//  Created by ALEX on 06.04.21.
//

import SwiftUI

struct User: Decodable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date  //should be a Date, not a String
    let tags: [String]

    let friends : [Friend]  //array of Friend structs

    struct Friend: Decodable {  // a single Friend, not multiple Friends
        let id: String
        let name: String
    }
}


struct TestVIew: View {
    @State var users = [User]()
    
    var body: some View {
        List{
                    ForEach(users, id: \.id) { item in
                        VStack(alignment: .leading){
                            Text(item.name)
//                                .font(.headline)
//                            Text(item.company)
                        }
                    }
                }
                .onAppear(perform: loadData)
            }
    func loadData() {
            guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
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
                        decoder.decode([User].self, from: data) {
                        DispatchQueue.main.async {
                            //decodedResponse is now [User] rather than Response.User
                            self.users = decodedResponse
                        }
                        return
                    }
                }
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")

            }.resume()
        }
    }


struct TestVIew_Previews: PreviewProvider {
    static var previews: some View {
        TestVIew()
    }
}
