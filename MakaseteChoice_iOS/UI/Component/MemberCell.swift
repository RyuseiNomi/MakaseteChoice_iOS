//
//  MemberCell.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/09/22.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct MemberCell: View {
    
    var member: Member
    @EnvironmentObject public var appState: AppState
    
    var body: some View {
        ZStack() {
            HStack() {
                Image("Member")
                Text(member.name)
                    .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                    .font(Font.custom("Helvetica-Light", size: 16))
                Spacer()
                Button(action: {
                    self.appState.deleteMember(name: self.member.name)
                }) {
                    Text("×")
                        .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                        .font(Font.custom("Helvetica-Light", size: 20))
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing:5))
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .background(Color(red: 255/255, green: 255/255, blue: 255/255))
        }
        .cornerRadius(10)
            .shadow(color: Color(red: 173/255, green: 216/255, blue: 230/255), radius: 1, x: 0, y: 5) //lightblue
    }
}

