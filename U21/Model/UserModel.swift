//
//  UserModel.swift
//  U21
//
//  Created by Kong on 3/31/2561 BE.
//  Copyright © 2561 u21. All rights reserved.
//

import Foundation
import CodableFirebase

struct UserModel: Codable {
    let uid: String
    let displayName: String
    let profileImgUrl: String
    let email: String
    let score: Int
}
