//
//  DecisionButton.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/05/09.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct DecisionButton: View {
    
    public var label:String
    public var maxWidth:CGFloat
    @EnvironmentObject public var appState: AppState
    
    var body: some View {
        ZStack(alignment: .center) {
            HStack(alignment: .center) {
                Text(self.label)
                    .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255)) //white
                    .font(Font.custom("Helvetica-Light", size: 20))
                    .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            }
            .frame(minWidth: 0, maxWidth: self.maxWidth, alignment: .center)
            .background(Color(red: 255/255, green: 127/255, blue: 80/255))
        }
        .cornerRadius(10)
        .shadow(color: Color(red: 173/255, green: 216/255, blue: 230/255), radius: 1, x: 0, y: 5) //lightblue
    }
}
