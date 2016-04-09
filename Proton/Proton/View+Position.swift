//
//  View+Position.swift
//  Proton
//
//  Created by McDowell, Ian J [ITACD] on 4/5/16.
//  Copyright © 2016 Ian McDowell. All rights reserved.
//

import UIKit

extension View {
    func position(top top: Percent? = nil, bottom: Percent? = nil, left: Percent? = nil, right: Percent? = nil) -> View {
        self.position = LayoutPosition(type: .Percent, top: top?.value, bottom: bottom?.value, left: left?.value, right: right?.value)
        return self
    }
    func position(top top: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil, right: CGFloat? = nil) -> View {
        self.position = LayoutPosition(type: .Absolute, top: top, bottom: bottom, left: left, right: right)
        return self
    }
    
    func positionCenter() -> View {
        positionCenterX()
        positionCenterY()
        return self
    }
    func positionCenterX() -> View {
        self.position.centerX()
        return self
    }
    func positionCenterY() -> View {
        self.position.centerY()
        return self
    }
    
    func positionTopLeft(offset: CGFloat? = 0) -> View {
        self.position = LayoutPosition(type: .Absolute, top: offset, bottom: nil, left: offset, right: nil)
        return self
    }
    func positionTopRight(offset: CGFloat? = 0) -> View {
        self.position = LayoutPosition(type: .Absolute, top: offset, bottom: nil, left: nil, right: offset)
        return self
    }
    func positionBottomLeft(offset: CGFloat? = 0) -> View {
        self.position = LayoutPosition(type: .Absolute, top: nil, bottom: offset, left: offset, right: nil)
        return self
    }
    func positionBottomRight(offset: CGFloat? = 0) -> View {
        self.position = LayoutPosition(type: .Absolute, top: nil, bottom: offset, left: nil, right: offset)
        return self
    }
    
    func positionTopLeft(offset: Percent) -> View {
        self.position = LayoutPosition(type: .Percent, top: offset.value, bottom: nil, left: offset.value, right: nil)
        return self
    }
    func positionTopRight(offset: Percent) -> View {
        self.position = LayoutPosition(type: .Percent, top: offset.value, bottom: nil, left: nil, right: offset.value)
        return self
    }
    func positionBottomLeft(offset: Percent) -> View {
        self.position = LayoutPosition(type: .Percent, top: nil, bottom: offset.value, left: offset.value, right: nil)
        return self
    }
    func positionBottomRight(offset: Percent) -> View {
        self.position = LayoutPosition(type: .Percent, top: nil, bottom: offset.value, left: nil, right: offset.value)
        return self
    }
    
    func positionFill(offset: CGFloat? = 0) -> View {
        self.position = LayoutPosition(type: .Absolute, top: offset, bottom: offset, left: offset, right: offset)
        return self
    }
    func positionFill(offset: Percent) -> View {
        self.position = LayoutPosition(type: .Percent, top: offset.value, bottom: offset.value, left: offset.value, right: offset.value)
        return self
    }
}
