//
//  MemberInputView.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/05/09.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import QGrid
import KeyboardObserving

struct MemberInputView: View {
    
    @State private(set) var isShowingModal:Bool = false
    @State private(set) var isInvalidName:Bool = false
    @State public var inputedMemberName:String = ""
    @EnvironmentObject public var appState: AppState
    
    var body: some View {
        VStack() {
            HStack() {
                Text("メンバー入力")
                    .fontWeight(.black)
                    .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) //whitesmoke
                    .font(Font.custom("Helvetica-Light", size: 25))
                    .padding(EdgeInsets(top: 10, leading: 5, bottom: 0, trailing: 0))
            }
            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
            .padding(EdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 0))
            if self.appState.memberObject.members.isEmpty {
                NoMemberViewComponent(paragraphOne: "メンバーがいません", paragraphTwo: "下の「追加」ボタンより", paragraphThree: "メンバーを追加しましょう")
            }
            QGrid(self.appState.memberObject.members,
                  columns: 2,
                  vSpacing: 15,
                  hSpacing: 5,
                  vPadding: 10,
                  hPadding: 10,
                  isScrollable: true
            ) { member in
                MemberCell(member: member)
            }
            HStack() {
                Text("入力したメンバー")
                    .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                Text(String(self.appState.memberObject.members.count))
                    .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) //whitesmoke
                    .font(Font.custom("Helvetica-Light", size: 30))
                Text("人")
                    .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
            }
            .padding(EdgeInsets(top: 2, leading: 0, bottom: 10, trailing:0))
            .frame(alignment: .leading)
            HStack() {
                TextField("名前を入力", text: $inputedMemberName, onCommit: {
                    self.validateInputedName(inputedName: self.inputedMemberName)
                })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 30, trailing: 5))
                Button(action:{
                    self.validateInputedName(inputedName: self.inputedMemberName)
                }) {
                    DecisionButton(label: "追加", maxWidth: 100)
                }.alert(isPresented: $isInvalidName) {
                    Alert(title: Text("メンバー入力エラー"), message: Text("同じ名前のメンバーは入力できません。"))
                }
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 30, trailing: 5))
            }
        }
        .keyboardObserving()
        .background(Color(red: 77/255, green: 77/255, blue: 77/255)) //gray
    }
    
    /// 入力された名前のバリデーションを行う
    /// [バリデーション内容]
    /// 1. 入力された名前が空かどうか→空の場合は何もしない
    /// 2. 既にグループに存在する名前かどうか→重複した名前の場合はアラートを出して弾く
    private func validateInputedName(inputedName: String) {
        if self.inputedMemberName == "" {
            return
        }
        if self.isDuplicateMemberName(inputedName: self.inputedMemberName) {
            self.isInvalidName.toggle()
            return
        }
        self.appState.addMember(member: Member(name: self.inputedMemberName))
        self.inputedMemberName = ""
    }
    
    /// 入力された名前と同じ名前がグループ内に存在しているかどうかを調べる
    private func isDuplicateMemberName(inputedName: String) -> Bool {
        for m in self.appState.memberObject.members {
            if m.name == inputedName {
                return true
            }
        }
        return false
    }
}

struct MemberInputView_Previews: PreviewProvider {
    static var previews: some View {
        MemberInputView()
    }
}
