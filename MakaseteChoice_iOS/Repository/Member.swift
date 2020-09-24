//
//  Member.swift
//  MakaseteChoice_iOS
//
//  Created by 能美龍星 on 2020/09/23.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct Member: Identifiable, Hashable {
    var id = UUID()
    var name:String
    var groupId:Int = 0
    var isPinned:Bool = false
}

