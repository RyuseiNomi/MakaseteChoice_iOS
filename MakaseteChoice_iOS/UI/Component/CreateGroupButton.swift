//
//  CreateGroupButton.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/05/10.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct CreateGroupButton: View {
    
    var body: some View {
        ZStack() {
            HStack() {
                Image("NewGroup")
                VStack() {
                    Text("グループを作って")
                        .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255))
                        .font(Font.custom("Helvetica-Light", size: 24))
                    Text("シャッフルする")
                        .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255))
                        .font(Font.custom("Helvetica-Light", size: 24))
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing:20))
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing:10))
            .background(Color(red: 255/255, green: 127/255, blue: 80/255)) //coral
        }
        .cornerRadius(10)
        .shadow(color: .gray, radius: 1, x: 0, y: 5)
    }
}
