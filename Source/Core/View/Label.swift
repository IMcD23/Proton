//
//  Label.swift
//  Proton
//
//  Created by McDowell, Ian J [ITACD] on 3/25/16.
//  Copyright © 2016 Ian McDowell. All rights reserved.
//

/// Wrapper for UILabel, which allows easy instantiation with text, if you wish.
public class Label: View<UILabel> {
    
    override public init() {
        super.init()
        
        #if os(OSX)
            view.editable = false
            view.bordered = false
            
            view.font = UIFont.systemFontOfSize(UIFont.labelFontSize())
        #endif
    }
    
    public convenience init(_ text: String) {
        self.init()
        view.text = text
        

    }

}