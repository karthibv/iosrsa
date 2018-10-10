//
//  EncryptTests.swift
//  SwiftyRSA iOS Tests
//
//  Created by Karthik on 9/10/18.
//  Copyright © 2018 Scoop. All rights reserved.
//

import Foundation
import XCTest
import SwiftyRSA

class EncryptTests : XCTestCase {
    
    let pubMod =  "r8iqr2NkSIauZmDqMWu/nSrBuF817zDk+ylG9Lhs7CZha2GRpbfJp9HFivIthxuwNSltz4u15fuWLD3X+qjTHt29mOYFGtTXfceWyWOjDPYcrpudGoUtPG8mtHiVljsNTVqi4tbkHHQ8CTPZrQUpkLMuYQCTWyOMrjmcGbWtOcD6uvXZpOg9XMS5/yOPNN0ZlIYLGIpPiDh4ZfI38CzOEZE74hae2QF+fYwW5W5CJ/jBVN+hzhZ3FALFLYdGRtIzFwsQhi/DPJEoHc7bY392xBGmQeL9sqttOHJieXj1DMKEejDq4q6AHwbum95BfHjryPwq0HymnizZXiNx+A4pHQ"
    
    let pubExp = "EQ"
    
    func test_justData() throws{
        let str = "Clear Text"
        _ = try ClearMessage(string: str, using: .utf8)
        XCTAssertTrue(true, "All good")
    }
    
    func test_encryptData() throws{
        
        var modulusStr = pubMod
        modulusStr = modulusStr.base64UrlToBase64().addPadding()
        let modulusData = Data(base64Encoded: modulusStr)

        var exponentStr = pubExp
        exponentStr = exponentStr.base64UrlToBase64().addPadding()
        let exponentData = Data(base64Encoded: exponentStr)
        print("exponent : \(exponentStr)")
        print("modulus : \(modulusStr)")
        
        let pemGen = PemGenerator(modulusHex: (modulusData?.hexDescription)!, exponentHex: (exponentData?.hexDescription)!, lengthModulus: (modulusData?.count)!, lengthExponent: (exponentData?.count)!)
        let pemString = pemGen.generatePublicPem()
        
        print("pemString : \(pemString)")

         //let str = "passW0rd1"

       // let pemKey1 = RSAConverter.pemFrom(mod: pubMod, exp: pubExp)
       //  print ("Public key1 is \(pemKey1).")
        // let pemKey =  try RSAUtils.pemFrom(mod: pubMod, exp: pubExp)
        
//        let rsaUtil:RSAUtils = RSAUtils(modulusHex: pubMod, exponentHex: pubExp)
//        print("\(rsaUtil.generatePublicPem())")
//
        
//        guard let path = Bundle.main.path(forResource: "swiftyrsa-public-citibase64", ofType: "txt") else {
//            return XCTFail("file not found in bundle")
//        }
//        let str = try String(contentsOf: URL(fileURLWithPath: path), encoding: .utf8)
//        let publicKey = try? PublicKey(base64Encoded: str)
//
//         //print ("Public key is \(pemKey).")
//         let clearMessage = try ClearMessage(string: str, using: .utf8)
//        // let publicKey = try PublicKey(base64Encoded: pemKey!)
//        let encrypted = try clearMessage.encrypted(with: publicKey!, padding: .PKCS1)
//         print ("encrypted data is \(encrypted).")
//
//        let publicKey = try PublicKey(pemNamed: "swiftyrsa-public")
//        let clear = try ClearMessage(string: "Clear Text", using: .utf8)
//        let encrypted = try clear.encrypted(with: publicKey, padding: .PKCS1)
//
//        // Then you can use:
//        let data = encrypted.data
//        let base64String = encrypted.base64String
        //XCTAssertNotNil(publicKey)
    }
}
