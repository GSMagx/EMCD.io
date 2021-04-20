//
//  ContentView.swift
//  Shared
//
//  Created by ALEX on 27.03.21.
//

import SwiftUI

struct Todo: Codable {
    
    public let total_count: Int
    public let all: Int
    public let active: Int
    public let inactive: Int
    public let dead_count: Int
}

struct ContentView: View {
    @ObservedObject var fetch = FetchToDo()
    var body: some View {
        VStack {
            List(fetch.todos) { todo in
                VStack(alignment: .leading) {
                    Text(String(todo.active))
            }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
