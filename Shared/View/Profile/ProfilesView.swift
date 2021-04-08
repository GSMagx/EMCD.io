//
//  ProfilesView.swift
//  EMCD.io
//
//  Created by ALEX on 08.04.21.
//

import SwiftUI

struct ProfilesView: View {
    var body: some View {
        ScrollView {
            HStack(spacing: 32) {
                ProfileHeaderView()
            }.padding(.top)
        }
    }
}

struct ProfilesView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilesView()
    }
}
