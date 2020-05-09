//
//  ShuffleResultView.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/05/09.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct ShuffleResultView: View {
    
    var member:[Member] = []
    var body: some View {
        VStack() {
            Text("シャッフル結果")
        }.navigationBarTitle("シャッフル結果", displayMode: .inline)
    }
}
