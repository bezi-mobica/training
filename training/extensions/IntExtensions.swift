//
// Created by Benedykt Ziobro on 17/11/2017.
// Copyright (c) 2017 Benedykt Ziobro. All rights reserved.
//

import Foundation

extension Int {

    public init(randomBelow upperLimit: UInt32) {
        self.init(arc4random_uniform(upperLimit))
    }
}