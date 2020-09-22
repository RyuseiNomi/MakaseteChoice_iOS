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
                .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                .font(Font.custom("Helvetica-Light", size: 24))
                .padding()
            Text("1.1.0")
                .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                .padding()
            Divider()
            Text("Credit")
                .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                .font(Font.custom("Helvetica-Light", size: 24))
                .padding()
            HStack() {
                Text("Icons in this app by ")
                    .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                Button(action : { UIApplication.shared.open(self.icon8Url) }) {
                    Text("Icons8")
                        .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                        .underline()
                }
            }
            .padding()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(red: 77/255, green: 77/255, blue: 77/255)) // gray
    }
}

struct CredentialView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
