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
    private let privacyPolicyUrl = URL(string: "https://ryuseinomi.github.io/MakaseteChoice_iOS/")!
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("App version")
                .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                .font(Font.custom("Helvetica-Light", size: 20))
                .fontWeight(.black)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 0))
            Text("2.0.1")
                .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255))
                .font(Font.custom("Helvetica", size: 20))
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 0))
            Text("Credit")
                .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                .font(Font.custom("Helvetica-Light", size: 20))
                .fontWeight(.black)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 0))
            HStack() {
                Text("Icons in this app by ")
                    .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                Button(action : { UIApplication.shared.open(self.icon8Url) }) {
                    Text("Icons8")
                        .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                        .underline()
                }
            }
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 0))
            Text("PrivacyPolicy")
                .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                .font(Font.custom("Helvetica-Light", size: 20))
                .fontWeight(.black)
                .padding()
            HStack() {
                Text("This app has a ")
                    .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                Button(action : { UIApplication.shared.open(self.privacyPolicyUrl) }) {
                    Text("privacy policy")
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
