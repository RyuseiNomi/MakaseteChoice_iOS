//
//  NoMemberViewComponent.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/09/22.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct NoMemberViewComponent: View {
    
    public var paragraphOne: String
    public var paragraphTwo: String
    public var paragraphThree: String
    
    var body: some View {
        VStack() {
            Text(self.paragraphOne)
                .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                .font(Font.custom("Helvetica-Light", size: 30))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
            Text(self.paragraphTwo)
                .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                .font(Font.custom("Helvetica-Light", size: 15))
            Text(self.paragraphThree)
                .foregroundColor(Color(red: 245/255, green: 245/255, blue: 245/255)) // whitesmoke
                .font(Font.custom("Helvetica-Light", size: 15))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
