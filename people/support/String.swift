//
//  String.swift
//  people
//
//  Created by Javier Martinez Zamorano on 13/9/22.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
