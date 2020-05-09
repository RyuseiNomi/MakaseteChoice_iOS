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
    var groupNum:Int = 0
    @State var shuffledGroup:[Member] = []
    @State private(set) var isCompletShuffle = false
    
    var body: some View {
        VStack() {
            Text("シャッフル結果")
        }
        .navigationBarTitle("シャッフル結果", displayMode: .inline)
        .onAppear(perform: { self.doShuffle(members: self.member, groupCount: self.groupNum) })
    }
    
    private func doShuffle(members: [Member], groupCount: Int){
        self.isCompletShuffle = false
        for member in members {
            for groupNum in 1...self.groupNum {
                self.shuffledGroup.append(Member(name: member.name, groupId: groupNum))
            }
        }
        dump(self.shuffledGroup)
        self.isCompletShuffle = true
    }
}
