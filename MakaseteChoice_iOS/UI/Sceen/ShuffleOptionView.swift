//
//  ShuffleOptionView.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/05/09.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct ShuffleOptionView: View {
    
    @State private(set) var groupNum:Int = 1
    @State private(set) var isUnderZero:Bool = false
    @State private(set) var isOverMemberNum:Bool = false
    @EnvironmentObject public var appState: AppState
    
    var body: some View {
        VStack() {
            HStack() {
                Text("入力されたメンバー")
                Text(String(self.appState.memberObject.members.count))
                    .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                    .font(Font.custom("Helvetica-Light", size: 30))
                Text("人")
            }
            Spacer()
            HStack() {
                Image("Group")
                VStack() {
                    Text("グループ数")
                        .font(Font.custom("Helvetica-Light", size: 28))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                    HStack() {
                        Button(action: {
                            if self.groupNum <= 1 {
                                self.isUnderZero = true
                                self.groupNum = 1
                                return
                            }
                            self.groupNum = self.groupNum - 1
                        }) {
                            Image("Minus")
                        }.alert(isPresented: $isUnderZero) {
                            Alert(title: Text("1より少ない数は指定できません。"))
                        }
                        Text(String(self.groupNum))
                            .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                            .font(Font.custom("Helvetica-Light", size: 48))
                            .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing:20))
                        Button(action: {
                            if self.groupNum > self.appState.memberObject.members.count-1 {
                                self.isOverMemberNum = true
                                return
                            }
                            self.groupNum = self.groupNum + 1
                        })
                        {
                            Image("Plus")
                        }.alert(isPresented: $isOverMemberNum) {
                            Alert(title: Text("入力したメンバーより多い数は指定できません。"))
                        }
                    }
                }
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing:20))
            Spacer()
            NavigationLink(destination: ShuffleResultView(members: self.appState.memberObject.members, groupNum: self.groupNum)) {
                DecisionButton()
            }
        }
        .navigationBarTitle("シャッフルオプション設定", displayMode: .inline)
        .background(Color(red: 255/255, green: 250/255, blue: 240/255)) //floralwhite
    }
}
