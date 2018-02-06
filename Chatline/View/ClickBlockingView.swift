//
//  ClickBlockingView.swift
//  Chatline
//
//  Created by BE on 2018-02-06.
//  Copyright © 2018 Restructural. All rights reserved.
//

import Cocoa

class ClickBlockingView: NSView {
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
    override func mouseDown(with event: NSEvent) {}
    override func mouseUp(with event: NSEvent) {}
    override func mouseDragged(with event: NSEvent) {}
    override func mouseMoved(with event: NSEvent) {}
}

