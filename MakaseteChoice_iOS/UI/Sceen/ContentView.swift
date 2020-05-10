//
//  ContentView.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/05/09.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                MenuView()
                CredentialMenuButton()
            }
            .background(Color(red: 255/255, green: 250/255, blue: 240/255)) //floralwhite
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
