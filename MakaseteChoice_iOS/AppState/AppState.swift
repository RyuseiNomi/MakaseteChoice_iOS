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
    
    public func deleteMember(member: Member) {
        // TODO 配列から要素を検索してindexで削除
    }
}
