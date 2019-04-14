//
//  WEAuthentificationHandler.swift
//  WiscEnroll
//
//  Created by Joe Holt on 3/12/19.
//  Copyright © 2019 Joe Holt. All rights reserved.
//

import UIKit
import LocalAuthentication

/**
 A class that helps the app with authenticating via face/touch id or password
 */
public class WEAuthentificationHandler: NSObject {

    /**
     Returns a string representing if the device is FaceID/TouchID
     - parameter type: manually specify device type, primarly used for testing
     - returns: a string in the format [Face/Touch]ID/Password
    */
    public func getAuthentificationDescription(type: WEBioauthType? = nil) -> String {
        let type: WEBioauthType = type ?? getBiometricType()
        return type.rawValue
    }
    
    /**
     Returns the authentication type of the current device
     - returns: biometry type of the current device
    */
    private func getBiometricType() -> WEBioauthType {
        let authContext = LAContext()
        if #available(iOS 11, *) {
            switch(authContext.biometryType) {
            case .faceID:
                return .face
            case .touchID:
                return .touch
            default:
                return .none
            }
        } else {
            return .touch
        }
    }
    
    
}
