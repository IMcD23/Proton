//
//  Proton.swift
//  Proton
//
//  Created by McDowell, Ian J [ITACD] on 3/28/16.
//  Copyright © 2016 Ian McDowell. All rights reserved.
//

/// The root of a Proton application. Set the `window` property of your AppDelegate to
/// an instance of this. 
public class Proton: UIWindow {
    
    #if os(iOS)
    public init(rootPage: Page) {
        super.init(frame: UIScreen.mainScreen().bounds)
    
        setup(rootPage)
    }
    #elseif os(OSX)
    public init(rootPage: Page, frame: CGRect) {
        super.init(frame: frame)
    
        setup(rootPage)
    }
    #endif
    
    private func setup(rootPage: Page) {
        self.backgroundColor = UIColor.whiteColor()
        
        // embed root navigation controller if needed.
        if let _ = rootPage as? Navigatable {
            self.rootViewController = UINavigationController(rootViewController: rootPage)
        } else {
            self.rootViewController = rootPage
        }
        
        self.makeKeyAndVisible()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}