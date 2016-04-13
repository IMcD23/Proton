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
    }
    
    public convenience init(_ text: String) {
        self.init()
        #if os(iOS)
        view.text = text
        #elseif os(OSX)
        view.string = text
        #endif
    }

}
