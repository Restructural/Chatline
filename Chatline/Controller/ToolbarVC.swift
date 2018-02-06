//
//  ToolbarVC.swift
//  Chatline
//
//  Created by BE on 2018-02-04.
//  Copyright © 2018 Restructural. All rights reserved.
//

import Cocoa

class ToolbarVC: NSViewController {
    
    // Outlets
    @IBOutlet weak var loginImage: NSImageView!
    @IBOutlet weak var loginLabel: NSTextField!
    @IBOutlet weak var loginStack: NSStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear() {
        setUpView()
    }
    
    func setUpView() {
        view.wantsLayer = true
        view.layer?.backgroundColor = chatGreen.cgColor
        
        loginStack.gestureRecognizers.removeAll()  // clears out anything that could be there
        let profilePage = NSClickGestureRecognizer(target: self, action: #selector(ToolbarVC.openProfilePage(_:)))
        loginStack.addGestureRecognizer(profilePage)
    }
    
    @objc func openProfilePage(_ recognizer: NSClickGestureRecognizer) {
        print("open profile page")
    }
}
