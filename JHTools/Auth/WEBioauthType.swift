//
//  BioauthType.swift
//  WiscEnroll
//
//  Created by Joe Holt on 3/12/19.
//  Copyright © 2019 Joe Holt. All rights reserved.
//

/**
 A enum representing the different authentication methods
 */
public enum WEBioauthType: String {
    case touch = "Touch ID/Password"
    case face = "Face ID/Password"
    case none = "Password"
}
