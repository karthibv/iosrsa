//
//  UtilExtensions.swift
//  SwiftyRSA
//
//  Created by Karthik on 10/10/18.
//  Copyright © 2018 Scoop. All rights reserved.
//

import Foundation
import Security

extension Data {
    public var hexDescription : String {
        return reduce(""){$0 + String(format: "%02x", $1)}
    }
    
}

extension String{
    
    public func hexToBase64() -> Data {
        var hex = self
        var data = Data()
        while hex.count > 0 {
            
            let indexHex = hex.index(hex.startIndex, offsetBy: 2)
            let c : String = String(hex[..<indexHex])
            hex = String(hex[indexHex...])
            var ch: UInt32 = 0
            Scanner(string: c).scanHexInt32(&ch)
            var char = UInt8 (ch)
            data.append(&char, count: 1)
        }
        //        let base64Str = data.base64EncodedString()
        
        return data // base64Str.clearPaddding()
    }
    
    public func base64ToBase64Url() -> String {
        let base64url = self.replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
        return base64url
    }
    
    public func base64UrlToBase64() -> String {
        let base64 = self.replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        /* NO PADDING
         while(base64.count % 4 != 0){
         base64.append("=")
         }*/
        return base64
    }
    
    public func clearPaddding() -> String {
        var tmp = self
        while(tmp.last == "="){
            tmp.removeLast()
        }
        return tmp
    }
    
    public func addPadding() -> String {
        var tmp = self
        while(tmp.count % 4 != 0){
            tmp.append("=")
        }
        return tmp
    }
    
}

