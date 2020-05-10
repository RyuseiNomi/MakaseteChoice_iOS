//
//  ShuffleResultView.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/05/09.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct ShuffleResultView: View {
    
    @State var members:[Member] = []
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
        .onAppear(perform: { self.doShuffle() })
    }
    
    private func doShuffle(){
        self.isCompletShuffle = false
        
        // 配列のシャッフル
        self.members.shuffle()
        
        // シャッフルしたメンバーにgroupIDを割り当てる
        var groupId:Int = 1;
        for member in members {
            self.shuffledGroup.append(Member(name: member.name, groupId: groupId))
            if groupId > self.groupNum - 1 {
                groupId = 1
                continue
            }
            groupId = groupId + 1
        }
        dump(self.shuffledGroup)
        self.isCompletShuffle = true
    }
}
