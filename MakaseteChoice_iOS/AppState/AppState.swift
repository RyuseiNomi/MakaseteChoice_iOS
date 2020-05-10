//
//  AppState.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/05/09.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

class AppState: ObservableObject {
    
    struct MemberObject {
        var members:[Member] = []
    }
    
    @Published public var memberObject = MemberObject()
    
    public func addMember(member: Member) {
        self.memberObject.members.append(member)
    }
    
    public func deleteMember(name: String) {
        // Swiftは要素を指定して配列の削除を行えないため、要素を検索してindex番号を取り出してから削除
        let deleteMemberIndex = self.memberObject.members.index(where: { $0.name == name })
        self.memberObject.members.remove(at: deleteMemberIndex!)
    }
}
