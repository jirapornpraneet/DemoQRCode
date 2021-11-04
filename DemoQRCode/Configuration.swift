//
//  Configuration.swift
//  DemoQRCode
//
//  Created by iOS Dev on 4/11/2564 BE.
//

import Foundation
class Configuration {
    
    //var screening = Configuration.Screening()
    
    
    // Screening System
    
    class Screening {
        
        /// Encrypt Key
        static var screeningEncryptKey = Configuration.Screening().config("passengerDataEncryptKey")
        
        /// Encrypt IV
        static var screeningEncryptIV = Configuration.Screening().config("passengerDataEncryptIV")
        
        
        /// Direct config
        
        func config(_ key: String) -> String {
            guard let value = Configuration.Screening.systemConfig.object(forKey: key) as? String else { return "" }
            return value
        }
        
        private static var systemConfig: NSDictionary {
            return buildConfigDict.object(forKey: "Screening") as! NSDictionary
        }
    }
    
    // MARK: - Path store
    
    private static var buildConfigDict: NSDictionary {
        var buildConfigDict: NSDictionary!
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist") {
           buildConfigDict  = NSDictionary(contentsOfFile: path)
        }
        return buildConfigDict
    }
}
