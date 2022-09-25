//
//  String+Resources.swift
//  hour-message
//
//  Created by Cora on 19/09/22.
//

import Foundation

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: "**\(self)**", comment: "")
    }
    
    func localized(with args: [String], bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        let format = NSLocalizedString(self, tableName: tableName, bundle: bundle, value: self, comment: "")
        return String(format: format, arguments: args)
    }

}

