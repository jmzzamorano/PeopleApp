//
//  UsersMapper.swift
//  people
//
//  Created by Javier Martinez Zamorano on 15/9/22.
//

import Foundation

protocol UsersMapper {
    func map(_ users: [User]) -> [UserItem]
}
