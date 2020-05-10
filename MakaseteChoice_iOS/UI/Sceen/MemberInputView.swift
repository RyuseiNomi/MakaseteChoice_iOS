//
//  MemberInputView.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/05/09.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import QGrid

struct Member: Identifiable, Hashable {
    var id = UUID()
    var name:String
    var groupId:Int = 0
}

struct MemberCell: View {
    
    var member: Member
    
    var body: some View {
        ZStack() {
            HStack() {
                Text(member.name)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .background(Color(red: 255/255, green: 255/255, blue: 255/255))
        }
        .cornerRadius(10)
        .shadow(color: Color(red: 173/255, green: 216/255, blue: 230/255), radius: 1, x: 0, y: 5) //lightblue
    }
}

struct MemberInputView: View {
    @State private(set) var name = ""
    @State private(set) var member:[Member] = []
    
    var body: some View {
        VStack() {
            Spacer()
            if self.member.isEmpty {
                Text("メンバーが入力されていません。")
            }
            QGrid(self.member,
                  columns: 1,
                  vSpacing: 25,
                  hSpacing: 0,
                  vPadding: 10,
                  hPadding: 20,
                  isScrollable: true
            ) { member in
                MemberCell(member: member)
            }
            TextField("名前を入力", text: $name, onCommit: {
                self.setMember(name: self.name)
                self.name = ""
            })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            NavigationLink(destination: ShuffleOptionView(member: self.member)) {
                DecisionButton()
            }
        }
        .navigationBarTitle("メンバーの入力", displayMode: .inline)
        .background(Color(red: 255/255, green: 250/255, blue: 240/255)) //floralwhite
    }
    
    /// Add member to list
    private func setMember(name: String) {
        self.member.append(Member(name: name, groupId: 0))
    }
}
