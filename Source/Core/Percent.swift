//
//  Percent.swift
//  Proton
//
//  Created by McDowell, Ian J [ITACD] on 4/5/16.
//  Copyright © 2016 Ian McDowell. All rights reserved.
//

public struct Percent {
    var value: CGFloat
}


postfix operator % {}

public postfix func % (percent: CGFloat) -> Percent {
    return Percent(value: percent / 100.0)
}