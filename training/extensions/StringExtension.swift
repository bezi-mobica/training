//
// Created by Benedykt Ziobro on 13/11/2017.
// Copyright (c) 2017 Benedykt Ziobro. All rights reserved.
//

import Foundation


extension String {
    internal init(randomSubStringCount: Int, randomStringLength: Int) {
        var result: String = ""
        let randomSubStringCount: Int = Int(randomBelow: randomSubStringCount)!

        for _ in 0...randomSubStringCount {
            let subStringLength = Int(randomBelow: randomStringLength)! + 1
            result += String(randomWithLength: subStringLength, allowedCharactersType: .alphabetic) + " "
        }

        self.init(result)!
    }
}