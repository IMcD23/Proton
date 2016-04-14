//
//  AppDelegate-OSX.swift
//  Proton
//
//  Created by McDowell, Ian J [ITACD] on 4/13/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Proton

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: UIWindow!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        self.window = Proton(rootPage: HomePage(), frame: CGRectMake(0, 0, 600, 600))
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

