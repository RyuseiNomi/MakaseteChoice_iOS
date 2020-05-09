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
            if isCompletShuffle == false {
                Text("シャッフル中...")
            }
            
        }
        .navigationBarTitle("シャッフル結果", displayMode: .inline)
        .onAppear(perform: { self.doShuffle(members: self.member, groupCount: self.groupNum - 1) })
    }
    
    private func doShuffle(members: [Member], groupCount: Int){
        self.isCompletShuffle = false
        
        var groupId:Int = 1;
        for member in members {
            self.shuffledGroup.append(Member(name: member.name, groupId: groupId))
            if groupId > groupCount {
                groupId = 1
                continue
            }
            groupId = groupId + 1
        }
        dump(self.shuffledGroup)
        self.isCompletShuffle = true
    }
}
