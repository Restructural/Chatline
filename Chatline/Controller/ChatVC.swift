//
//  ChatVC.swift
//  Chatline
//
//  Created by BE on 2018-02-04.
//  Copyright © 2018 Restructural. All rights reserved.
//

import Cocoa

class ChatVC: NSViewController {
    
    // Outlets
    @IBOutlet weak var channelTitle: NSTextField!
    @IBOutlet weak var channelDescription: NSTextField!
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var typingUsersLabel: NSTextField!
    @IBOutlet weak var messageOutlineView: NSView!
    @IBOutlet weak var messageText: NSTextField!
    @IBOutlet weak var sendMessageButton: NSButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear() {
        setUpView()
    }
    
    
    
    func setUpView() {
        view.wantsLayer = true
        view.layer?.backgroundColor = CGColor.white
        
        messageOutlineView.wantsLayer = true
        messageOutlineView.layer?.backgroundColor = CGColor.white
        messageOutlineView.layer?.borderColor = NSColor.controlHighlightColor.cgColor
        messageOutlineView.layer?.borderWidth = 2
        messageOutlineView.layer?.cornerRadius = 5
        
        sendMessageButton.styleButtonText(button: sendMessageButton, buttonName: "Send", fontColor: .darkGray, alignment: .center, font: HELVETICA_REGULAR, size: 13.0)
    }
    
    
    @IBAction func sendMessageButtonClicked(_ sender: Any) {
    }
    
}
