//
//  String+Extension.swift
//  DemoQRCode
//
//  Created by iOS Dev on 4/11/2564 BE.
//

import Foundation
import CryptoSwift
import UIKit

extension String {
    
    func aesEncrypt(key: String, iv: String) throws -> String {
        let encrypted = try AES(key: Array(key.utf8), blockMode: CBC(iv: Array(iv.utf8))).encrypt([UInt8](self.data(using: .utf8)!))
        return Data(encrypted).base64EncodedString()
    }

    func aesDecrypt(key: String, iv: String) throws -> String {
        guard let data = Data(base64Encoded: self) else { return "" }
        let decrypted = try AES(key: Array(key.utf8), blockMode: CBC(iv: Array(iv.utf8))).decrypt([UInt8](data))
        return String(bytes: decrypted, encoding: .utf8) ?? self
    }
}

