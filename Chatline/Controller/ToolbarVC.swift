//
//  ToolbarVC.swift
//  Chatline
//
//  Created by BE on 2018-02-04.
//  Copyright © 2018 Restructural. All rights reserved.
//

import Cocoa

enum ModalType {
    case logIn
}

class ToolbarVC: NSViewController {
    
    // Outlets
    @IBOutlet weak var loginImage: NSImageView!
    @IBOutlet weak var loginLabel: NSTextField!
    @IBOutlet weak var loginStack: NSStackView!
    
    // Variables
    
    var modalBGView : ClickBlockingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear() {
        setUpView()
    }
    
    func setUpView() {
        NotificationCenter.default.addObserver(self, selector: #selector(ToolbarVC.presentModal(_:)), name: NOTIFICATION_PRESENT_MODAL, object: nil)
        
        view.wantsLayer = true
        view.layer?.backgroundColor = chatGreen.cgColor
        
        loginStack.gestureRecognizers.removeAll()  // clears out anything that could be there
        let profilePage = NSClickGestureRecognizer(target: self, action: #selector(ToolbarVC.openProfilePage(_:)))
        loginStack.addGestureRecognizer(profilePage)
    }
    
    @objc func openProfilePage(_ recognizer: NSClickGestureRecognizer) {
        let loginDict: [String: ModalType] = [USER_INFO_MODAL: ModalType.logIn]
        NotificationCenter.default.post(name: NOTIFICATION_PRESENT_MODAL, object: nil, userInfo: loginDict)
    }
    
    @objc func presentModal(_ notif: Notification) {
        if modalBGView == nil {
            modalBGView = ClickBlockingView()
            modalBGView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(modalBGView, positioned: .above, relativeTo: loginStack)
            let topConstraint = NSLayoutConstraint(item: modalBGView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 50)
            let leftConstraint = NSLayoutConstraint(item: modalBGView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
            let rightConstraint = NSLayoutConstraint(item: modalBGView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
            let bottomConstraint = NSLayoutConstraint(item: modalBGView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
            view.addConstraints([topConstraint, leftConstraint, rightConstraint, bottomConstraint])
            modalBGView.layer?.backgroundColor = CGColor.black
            modalBGView.alphaValue = 0.8
            
        }
        
    }
}
