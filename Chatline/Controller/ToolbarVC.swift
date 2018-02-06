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
    var modalView : NSView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear() {
        setUpView()
    }
    
    func setUpView() {
        NotificationCenter.default.addObserver(self, selector: #selector(ToolbarVC.presentModal(_:)), name: NOTIF_PRESENT_MODAL, object: nil)
        
        view.wantsLayer = true
        view.layer?.backgroundColor = chatGreen.cgColor
        
        loginStack.gestureRecognizers.removeAll()  // clears out anything that could be there
        let profilePage = NSClickGestureRecognizer(target: self, action: #selector(ToolbarVC.openProfilePage(_:)))
        loginStack.addGestureRecognizer(profilePage)
    }
    
    @objc func openProfilePage(_ recognizer: NSClickGestureRecognizer) {
        let loginDict: [String: ModalType] = [USER_INFO_MODAL: ModalType.logIn]
        NotificationCenter.default.post(name: NOTIF_PRESENT_MODAL, object: nil, userInfo: loginDict)
    }
    
    @objc func presentModal(_ notif: Notification) {
        var modalWidth = CGFloat(0.0)
        var modalHeight = CGFloat(0.0)
    
        print("modal launched")
        if modalBGView == nil {
            modalBGView = ClickBlockingView()
            modalBGView.wantsLayer = true
            
            modalBGView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(modalBGView, positioned: .above, relativeTo: loginStack)
            let topCn = NSLayoutConstraint(item: modalBGView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 50)
            let leftCn = NSLayoutConstraint(item: modalBGView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
            let rightCn = NSLayoutConstraint(item: modalBGView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
            let bottomCn = NSLayoutConstraint(item: modalBGView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
            view.addConstraints([topCn, leftCn, rightCn, bottomCn])
            modalBGView.layer?.backgroundColor = CGColor.black
            modalBGView.alphaValue = 0.0
            
            let closeBackgroundClick = NSClickGestureRecognizer(target: self, action: #selector(ToolbarVC.closeModalClick(_:)))
            modalBGView.addGestureRecognizer(closeBackgroundClick)
            
            // instantiate the xib
            
            guard let modalType = notif.userInfo?[USER_INFO_MODAL] as? ModalType else { return }
            
            switch modalType {
            case ModalType.logIn:
                modalView = ModalLogin()
                modalWidth = 475
                modalHeight = 300
            }
            
            modalView.wantsLayer = true
            modalView.translatesAutoresizingMaskIntoConstraints = false // we will be assigning constraints
            modalView.alphaValue = 0
            view.addSubview(modalView, positioned: .above, relativeTo: modalBGView)
            
            let horizontalConstraint = modalView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            let verticalConstraint = modalView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            let widthConstraint = modalView.widthAnchor.constraint(equalToConstant: modalWidth)
            let heightConstraint = modalView.heightAnchor.constraint(equalToConstant: modalHeight)
            
            NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        }
        
        NSAnimationContext.runAnimationGroup({ (context) in
            context.duration = 0.5
            modalBGView.animator().alphaValue = 0.6
            modalView.animator().alphaValue = 1.0
            self.view.layoutSubtreeIfNeeded() // resets if needed
        }, completionHandler: nil)
        
    }
    
    @objc func closeModalClick(_ recognizer: NSClickGestureRecognizer) {
        closeModal()
    }
    
    func closeModal() {
        NSAnimationContext.runAnimationGroup({ (context) in
            context.duration = 0.5
            modalBGView.animator().alphaValue = 0.0
            self.view.layoutSubtreeIfNeeded()
        }, completionHandler: {
            if self.modalBGView != nil {
                self.modalBGView.removeFromSuperview()
                self.modalBGView = nil
            }
        })
    }
}
