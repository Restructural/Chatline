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
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        Bundle.main.loadNibNamed(NSNib.Name(rawValue: "ModalLogin"), owner: self, topLevelObjects: nil)
        self.view.frame = NSRect(x: 0, y: 0, width: 475, height: 300)
        self.addSubview(self.view)
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        setUpView()
    }
    
    func setUpView() {
        view.layer?.backgroundColor = CGColor.white
        view.layer?.cornerRadius = 7
    }
    
}
