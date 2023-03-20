//
//  JoinResponse.swift
//  Fland-iOS-Project
//
//  Created by 김우성 on 2023/01/28.
//

import Foundation

struct JoinResponse: Decodable {
    var code: Int?
    var data: String?
    var description: String?
}
