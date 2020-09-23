//
//  ShuffleInteractor.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/09/23.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

/// メンバーのシャッフルに関する処理を記述するクラス
class ShuffleInteractor {
    
    public var appState:AppState
    private(set) var sortedMembers:[Member] = []
    
    /// ViewコンポーネントよりEnvironmentObjectを取得し、クラスプロパティに格納する
    init(appState: AppState) {
        self.appState = appState
    }
    
    /// 指定された組分け数に応じてグループメンバーをチョイスする
    public func doShuffle(groupNumber: Int) -> [Member]{
        var members = self.appState.memberObject.members
        var shuffledMember:[Member] = []

        // 配列のシャッフル
        members.shuffle()
        
        // シャッフルしたメンバーにgroupIDを割り当てる
        var groupId:Int = 1;
        for member in members {
            shuffledMember.append(Member(name: member.name, groupId: groupId))
            if groupId > groupNumber - 1 {
                groupId = 1
                continue
            }
            groupId = groupId + 1
        }
        
        // GroupIDでメンバーをSortする
        self.sortedMembers = shuffledMember.sorted{ $0.groupId < $1.groupId }
        return self.sortedMembers
    }
}
