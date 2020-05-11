//
//  CredentialMenuButton.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/05/10.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct CredentialMenuButton: View {
    
    var body: some View {
        ZStack() {
            NavigationLink(destination: CredentialView()) {
                HStack() {
                    Image("Phone")
                    Text("このアプリについて")
                        .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                        .font(Font.custom("Helvetica-Light", size: 20))
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing:20))
                .background(Color(red: 255/255, green: 255/255, blue: 255/255))
            }
        }
        .cornerRadius(10)
        .shadow(color: .gray, radius: 1, x: 0, y: 5)
        .padding()
    }
}
