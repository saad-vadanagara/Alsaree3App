//
//  EncriptionManager.swift
//  Alsaree3App
//
//  Created by Neosoft on 07/01/24.
//

import Foundation
class EncriptionManager{
    
    func aesEncrypt(value: String, key: String, iv: String) throws -> String {
        let data = value.data(using: .utf8)!
        var encryptedData:Data? = Data(base64Encoded: "")
        do{
            let encrypted = try AES(key: key, iv: iv, padding: .pkcs5).encrypt([UInt8](data))
            encryptedData = Data(encrypted)
        }
        catch let error{
            print(error.localizedDescription)

        }

        return encryptedData!.base64EncodedString()
    }
}


