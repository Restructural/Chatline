//
//  ChannelVC.swift
//  Chatline
//
//  Created by BE on 2018-02-04.
//  Copyright © 2018 Restructural. All rights reserved.
//

import Cocoa

class ChannelVC: NSViewController {
    
    // Outlets
    @IBOutlet weak var userNameLabel: NSTextField!
    @IBOutlet weak var addChannelButton: NSButton!
    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear() {
        SetUpView()
    }
    
    @IBAction func addChannelClicked(_ sender: Any) {
    }
    
    
    func SetUpView() {
        view.wantsLayer = true
        view.layer?.backgroundColor = chatGreen.cgColor
        
        addChannelButton.styleButtonText(button: addChannelButton, buttonName: "Add +", fontColor: .controlColor, alignment: .center, font: HELVETICA_BOLD, size: 13.0)
    
    
    }
    
}
