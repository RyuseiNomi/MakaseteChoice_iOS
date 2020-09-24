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

    /// ViewコンポーネントよりEnvironmentObjectを取得し、クラスプロパティに格納する
    init(appState: AppState) {
        self.appState = appState
    }
    
    /// 指定された組分け数に応じてグループメンバーをチョイスする
    public func doShuffle(groupNumber: Int) -> [Member] {
        var members = self.appState.memberObject.members
        var shuffledMember:[Member] = []
        var pinnedMembers:[Member] = []
        
        // ピン留めの対象となっているメンバーを配列から除外
        for member in members {
            if member.isPinned == true {
                pinnedMembers.append(member)
                let targetMemberIndex:Int? = members.index(where: { $0.name == member.name })
                members.remove(at: targetMemberIndex!)
            }
        }

        // 配列のシャッフル
        members.shuffle()
        
        // シャッフルしたメンバーにgroupIDを割り当てる
        var groupId:Int = 1;
        for member in members {
            shuffledMember.append(Member(name: member.name, groupId: groupId))
            
            // 共通のStateにメンバーのグループIDを保持
            let targetMemberIndex:Int? = self.appState.memberObject.members.index(where: { $0.name == member.name })
            if targetMemberIndex == nil {
                // 削除されたユーザを選択しているため、何もせずfor文を抜ける
                continue
            }
            self.appState.memberObject.members[targetMemberIndex!].groupId = groupId
            if groupId > groupNumber - 1 {
                groupId = 1
                continue
            }
            groupId = groupId + 1
        }
        
        // ピン留めされていたメンバーを戻す
        shuffledMember.append(contentsOf: pinnedMembers)
        
        // GroupIDでメンバーをSortする
        var sortedMembers:[Member] = []
        sortedMembers = shuffledMember.sorted{ $0.groupId < $1.groupId }
        return sortedMembers
    }
}
