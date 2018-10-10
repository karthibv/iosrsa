//
//  KeyTests.swift
//  SwiftyRSA
//
//  Created by Loïs Di Qual on 9/19/16.
//  Copyright © 2016 Scoop. All rights reserved.
//

import XCTest

// Using @testable here so we can call `SwiftyRSA.generateRSAKeyPair(sizeInBits:applyUnitTestWorkaround)`
@testable import SwiftyRSA

class PublicKeyTests: XCTestCase {
    
    func test_ModwithNumericExp() throws {
        let pubMod = "23151605316550543502091005979812836911164370684487004174214738813978544903785146375701917506595433744091072582939237643945583547667458054661910945584897460416082012661534967779315957456681632959920551890465524906615875878902446435389773955620825647178707773738268428521045116587832180718366396844852118689163869995116433281801055144015845967739399824501794878728801930412178937384219790647423704951462917020761007632240317527188401858434194658455630138653964988844305096403435321437424372043632971868788606169372487327533952180734474969485622112311461886904627464117292630520196415799432779668002129441596116098809627"
        
        let pubExp = "3"
        
        let modulusStr1 = Data(pubMod.utf8)
        let expData = Data(pubExp.utf8)

        let pemGen = PemGenerator(modulusHex: (modulusStr1.hexDescription), exponentHex: (expData.hexDescription), lengthModulus: (modulusStr1.count), lengthExponent: (expData.count))
        let pemString = pemGen.generatePublicPem()
        
        print("pemString : \(pemString)")

    
        let publicKey = try? PublicKey(base64Encoded: pemString)
        
        let ciperText = "1234ffffffffffff"
        let ciperData = Data(ciperText.hexToBase64())
        let clearMessage = try ClearMessage(data : ciperData)
        let encrypted = try clearMessage.encrypted(with: publicKey!, padding: .PKCS1)

        print("Encypt : \(encrypted.data.hexDescription)")
        XCTAssertNotNil(publicKey)
    }
    
   
    
}
