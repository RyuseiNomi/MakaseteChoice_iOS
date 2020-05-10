//
//  DecisionButton.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/05/09.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct DecisionButton: View {
    var body: some View {
        ZStack(alignment: .center) {
            HStack(alignment: .center) {
                Text("決定")
                    .font(Font.custom("Helvetica-Light", size: 28))
                    .padding()
            }
            .frame(minWidth: 0, maxWidth: 100, alignment: .leading)
            .background(Color(red: 255/255, green: 255/255, blue: 255/255))
        }
        .cornerRadius(10)
        .shadow(color: Color(red: 173/255, green: 216/255, blue: 230/255), radius: 1, x: 0, y: 5) //lightblue
    }
}
