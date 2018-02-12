//
//  Constants.swift
//  Chatline
//
//  Created by BE on 2018-02-04.
//  Copyright © 2018 Restructural. All rights reserved.
//

import Cocoa

typealias CompletionHandler = (_ Success: Bool) -> ()

// URL Constants
let BASE_URL = "https://chatlines.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"

// Colours (font is NSColor backgrond is CGColor)
let chatPurple = NSColor(calibratedRed: 0.10, green: 0.12, blue: 0.09, alpha: 1.00)
let chatGreen = NSColor(calibratedRed: 0.02, green: 0.16, blue: 0.18, alpha: 1.00)

// Fonts
let HELVETICA_REGULAR = "HelveticaNeue"
let HELVETICA_BOLD = "HelveticaNeue-Bold"

// Notifications
let USER_INFO_MODAL = "modalUserInfo"
let NOTIF_PRESENT_MODAL = Notification.Name("presentModal")
let NOTIF_CLOSE_MODAL = Notification.Name("closeModal")
let USER_INFO_REMOVE_IMMEDIATELY = "modalRemoveImmediately"

// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
