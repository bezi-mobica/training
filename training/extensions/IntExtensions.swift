//
// Created by Benedykt Ziobro on 17/11/2017.
// Copyright (c) 2017 Benedykt Ziobro. All rights reserved.
//

import Foundation

extension Int {
    /// Initializes a new `Int ` instance with a random value below a given `Int`.
    ///
    /// - Parameters:
    ///   - randomBelow: The upper bound value to create a random value with.
    public init(randomBelow upperLimit: UInt32) {
        self.init(arc4random_uniform(UInt32(upperLimit)))
    }

    public func times(_ closure: () -> Void) {
        guard self > 0 else {
            return
        }
        for _ in 0..<self {
            closure()
        }
    }
}