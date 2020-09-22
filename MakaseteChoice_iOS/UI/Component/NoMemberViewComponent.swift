//
//  NoMemberViewComponent.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/09/22.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct NoMemberViewComponent: View {
    
    var body: some View {
        VStack() {
            Text("メンバーがいません。")
                .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                .font(Font.custom("Helvetica-Light", size: 30))
            //Text("右下のボタンから")
            //    .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
            //    .font(Font.custom("Helvetica-Light", size: 30))
            //Text("メンバーを追加しましょう")
            //    .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
            //    .font(Font.custom("Helvetica-Light", size: 30))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
