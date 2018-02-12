//
//  ModalCreateAccount.swift
//  Chatline
//
//  Created by BE on 2018-02-07.
//  Copyright © 2018 Restructural. All rights reserved.
//

import Cocoa

class ModalCreateAccount: NSView {

    // Outlets
    @IBOutlet weak var view : NSView!
    @IBOutlet weak var nameText: NSTextField!
    @IBOutlet weak var emailText: NSTextField!
    @IBOutlet weak var passwordText: NSSecureTextField!
    @IBOutlet weak var profileImage: NSImageView!
    @IBOutlet weak var createAccountButton: NSButton!
    @IBOutlet weak var chooseImageButton: NSButton!
    @IBOutlet weak var progressSpinner: NSProgressIndicator!
    @IBOutlet weak var stackView: NSStackView!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        Bundle.main.loadNibNamed(NSNib.Name(rawValue: "ModalCreateAccount"), owner: self, topLevelObjects: nil)
        
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
    
    @IBAction func createAccountButtonClicked(_ sender: Any) {
        AuthService.instance.registerUser(email: emailText.stringValue, password: passwordText.stringValue) { (success) in
            
            if success {
                AuthService.instance.loginUser(email: self.emailText.stringValue, password: self.passwordText.stringValue, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: self.nameText.stringValue, email: self.emailText.stringValue, avatarName: "darkorlight", avatarColor: "", completion: { (success) in
                            NotificationCenter.default.post(name: NOTIF_CLOSE_MODAL, object: nil)
                        })
                    }
                })
            }
        }
    }
    
    @IBAction func chooseImageButtonClicked(_ sender: Any) {
    }
    
    func setUpView() {
        self.view.frame = NSRect(x: 0, y: 0, width: 475, height: 300)
        view.layer?.backgroundColor = CGColor.white
        view.layer?.cornerRadius = 7
        
        // Button Styling   (connect iboutlets and actions first)
        
        profileImage.layer?.cornerRadius = 10
        profileImage.layer?.borderColor = NSColor.gray.cgColor
        profileImage.layer?.borderWidth = 3
        
        createAccountButton.layer?.backgroundColor = chatGreen.cgColor
        chooseImageButton.layer?.backgroundColor = chatGreen.cgColor
        
        createAccountButton.layer?.cornerRadius = 7
        chooseImageButton.layer?.cornerRadius = 7
        
        createAccountButton.styleButtonText(button: createAccountButton, buttonName: "Create Account", fontColor: .white
        , alignment: .center, font: HELVETICA_BOLD, size: 13.0)
        chooseImageButton.styleButtonText(button: chooseImageButton, buttonName: "Choose Avatar", fontColor: .white, alignment: .center, font: HELVETICA_BOLD, size: 13.0)
        
        nameText.focusRingType = .none
        emailText.focusRingType = .none
        passwordText.focusRingType = .none
        

    }

    
}
