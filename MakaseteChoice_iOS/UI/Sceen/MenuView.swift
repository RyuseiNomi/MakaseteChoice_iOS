//
//  MenuView.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/05/10.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    var body: some View {
        NavigationView {
            VStack() {
                NavigationLink(destination: MemberInputView()) {
                    CreateGroupButton()
                }
                NavigationLink(destination: MemberInputView()) {
                    CreateGroupButton()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarTitle("ホーム", displayMode: .inline)
        }
    }
}
