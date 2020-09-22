//
//  NoGroupViewComponent.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/09/22.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct NoGroupViewComponent: View {
    
    var body: some View {
        VStack() {
            Text("グループがありません。")
                .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                .font(Font.custom("Helvetica-Light", size: 25))
            Text("右下のボタンから")
                .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                .font(Font.custom("Helvetica-Light", size: 25))
            Text("グループをチョイスしましょう")
                .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                .font(Font.custom("Helvetica-Light", size: 25))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
