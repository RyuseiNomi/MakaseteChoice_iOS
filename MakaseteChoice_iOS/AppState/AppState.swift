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
}
