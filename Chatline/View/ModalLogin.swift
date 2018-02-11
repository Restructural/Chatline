//
//  ModalLogin.swift
//  Chatline
//
//  Created by BE on 2018-02-06.
//  Copyright © 2018 Restructural. All rights reserved.
//

import Cocoa

class ModalLogin: NSView {
    
    // Outlets
    @IBOutlet weak var view : NSView!
    @IBOutlet weak var userNameText: NSTextField!
    @IBOutlet weak var passwordText: NSSecureTextField!
    @IBOutlet weak var emailLoginButton: NSButton!
    @IBOutlet weak var createAccountButton: NSButton!
    @IBOutlet weak var stackView: NSStackView!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        Bundle.main.loadNibNamed(NSNib.Name(rawValue: "ModalLogin"), owner: self, topLevelObjects: nil)
        
        self.addSubview(self.view)
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        setUpView()
    }
    
    @IBAction func closeModalClicked(_ sender: Any) {
        NotificationCenter.default.post(name: NOTIF_CLOSE_MODAL, object: nil)
    }
    
    @IBAction func emailLoginButtonClicked(_ sender: Any) {
    }
    
    @IBAction func createAccountButtonClicked(_ sender: Any) {
        let closeImmediatelyDict:[String: Bool] = [USER_INFO_REMOVE_IMMEDIATELY: true]
        NotificationCenter.default.post(name: NOTIF_CLOSE_MODAL, object: nil, userInfo: closeImmediatelyDict)
        let createAccountDict:[String: ModalType] = [USER_INFO_MODAL: ModalType.createAccount]
        NotificationCenter.default.post(name: NOTIF_PRESENT_MODAL, object: nil, userInfo: createAccountDict)
    }
    
    
    func setUpView() {
        self.view.frame = NSRect(x: 0, y: 0, width: 475, height: 300)
        view.layer?.backgroundColor = CGColor.white
        view.layer?.cornerRadius = 7
        
// Button Styling   (connect iboutlets and actions first)
        emailLoginButton.layer?.backgroundColor = chatGreen.cgColor
        emailLoginButton.layer?.cornerRadius = 7
        emailLoginButton.styleButtonText(button: emailLoginButton, buttonName: "Login", fontColor: .white, alignment: .center, font: HELVETICA_BOLD, size: 14.0)
        
        createAccountButton.styleButtonText(button: createAccountButton, buttonName: "Create Account", fontColor: chatGreen, alignment: .center, font: HELVETICA_REGULAR, size: 12.0)
    }
    
}
