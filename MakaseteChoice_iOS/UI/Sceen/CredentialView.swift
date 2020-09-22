//
//  CredentialView.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/05/10.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct CredentialView: View {
    
    private let icon8Url = URL(string: "https://icons8.com")!
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("アプリのバージョン")
                .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                .font(Font.custom("Helvetica-Light", size: 24))
                .padding()
            Text("1.0.0")
                .foregroundColor(.black)
                .padding()
            Divider()
            Text("Credit")
                .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                .font(Font.custom("Helvetica-Light", size: 24))
                .padding()
            HStack() {
                Text("Icons in this app by ")
                    .foregroundColor(.black)
                Button(action : { UIApplication.shared.open(self.icon8Url) }) {
                    Text("Icons8")
                }
            }
            .padding()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(red: 255/255, green: 250/255, blue: 240/255)) //floralwhite
    }
}

struct CredentialView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
