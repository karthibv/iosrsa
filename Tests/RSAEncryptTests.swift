//
//  RSAEncryptTests.swift
//  SwiftyRSA
//
//  Created by Karthik on 10/10/18.
//  Copyright © 2018 Scoop. All rights reserved.
//

import XCTest


class RSAEncryptTests : XCTestCase {
    
    func test_initWithBase64String() throws {
        
        let pubMod = "B76562EC83AEA03426A5818888B6F93072644B625DC27A0A36221C74CF7F9D999E261913C3D4A5EC0C2501C2FE14A027F992A474095E00F936E7E0ADD9E513B7C8A83ACF45E3798F6ACE5A0EED06F6206E621EE7D686F7595A7B82F1B257FA603545ED2EDBEC29BFDD0BF8DD23C20FC3028C71E7781394FF9CB7084CB37713D5B5613B026991CD626A95F8A8C1B068D016321C7DDAA307257A2A621BCE70AE711B274F91399F21A3E156F0133A7E293FAC58FA9F06B27CE16859534985A6AB619E928F1429EE9B0AFEABFAFDCDFC0EB8351605A173C0AFC1D064E333826F8F328BEFE9D019CEE68764D71D04FE26DC332EBEF4258E1008B13DF7D33F1CE6FF1B"
        
        let pubExp = "3"
        
        var modulusStr = pubMod
        modulusStr = modulusStr.base64UrlToBase64().addPadding()
        let modulusData = Data(base64Encoded: modulusStr)
        
        var exponentStr = pubExp
        exponentStr = exponentStr.base64UrlToBase64().addPadding()
        let exponentB64Data = Data(base64Encoded: exponentStr)
        let expData = Data(exponentStr.utf8)
        
        
        let pemGen = PemGenerator(modulusHex: (modulusData?.hexDescription)!, exponentHex: (expData.hexDescription), lengthModulus: (modulusData?.count)!, lengthExponent: (expData.count))
        let pemString = pemGen.generatePublicPem()
        
        print("pemString : \(pemString)")
        
        
        
        let publicKey = try? PublicKey(base64Encoded: pemString)
        let text = "password!"
        let clearMessage = try ClearMessage(string: text, using: .utf8)
        let encrypted = try clearMessage.encrypted(with: publicKey!, padding: .PKCS1)
        print("Encypt : \(encrypted)")
        
        XCTAssertNotNil(publicKey)
    }
}
