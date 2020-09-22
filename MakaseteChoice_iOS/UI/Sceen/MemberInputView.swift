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
import Combine

struct Member: Identifiable, Hashable {
    var id = UUID()
    var name:String
    var groupId:Int = 0
}

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

struct MemberInputView: View {
    
    @State private(set) var isShowingModal = false
    @State public var inputedMemberName:String = ""
    @EnvironmentObject public var appState: AppState
    
    var body: some View {
        VStack() {
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
            if self.appState.memberObject.members.isEmpty {
                NoMemberViewComponent()
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
            Spacer()
            HStack() {
                Spacer()
                ZStack() {
                    Button(action: {
                        let alertHC = UIHostingController(rootView: MemberInputAlert(inputedMemberName: self.$inputedMemberName))
                        alertHC.preferredContentSize = CGSize(width: 200, height: 100)
                        alertHC.modalPresentationStyle = UIModalPresentationStyle.formSheet
                        UIApplication.shared.windows[0].rootViewController?.present(alertHC, animated: true)
                        self.isShowingModal.toggle()
                    }, label: {
                        Text("＋")
                    })
                    .frame(width:60, height:60)
                    .background(Color.orange)
                    .cornerRadius(30.0)
                    .shadow(color: .gray, radius: 3, x: 3, y: 3)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 30.0, trailing: 30.0))
                }
            }
            TextField("名前を入力", text: $inputedMemberName, onCommit: {
                if self.inputedMemberName == "" {
                    return
                }
                self.inputedMemberName = ""
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 30, trailing: 5))
        }
        .keyboardObserving()
        .background(Color(red: 77/255, green: 77/255, blue: 77/255)) //gray
    }
}

struct MemberInputAlert: View {
    @State private var name:String = ""
    @Binding public var inputedMemberName:String

    var body: some View {
        ZStack() {
            VStack() {
                Text("名前を入力")
                TextField("名前を入力", text: $name).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                Divider()
                HStack {
                    Spacer()
                    Button(action: {
                        UIApplication.shared.windows[0].rootViewController?.dismiss(animated: true, completion: {
                            self.inputedMemberName = self.name
                        })
                    }) {
                        Text("OK")
                    }
                    Spacer()
                    Divider()
                    Spacer()
                    Button(action: {
                        UIApplication.shared.windows[0].rootViewController?.dismiss(animated: true, completion: {})
                    }) {
                        Text("Cancel")
                    }
                    Spacer()
                }.padding(0)
            }
            .frame(width: 300, height: 200)
            .background(Color(white: 0.9))
        }
        .background(Color.clear)
    }
}

struct MemberInputView_Previews: PreviewProvider {
    static var previews: some View {
        MemberInputView()
    }
}
