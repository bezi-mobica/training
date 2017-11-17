//
// Created by Benedykt Ziobro on 13/11/2017.
// Copyright (c) 2017 Benedykt Ziobro. All rights reserved.
//

import Foundation


extension String {

    internal init(randomSubStringCount: UInt32, randomStringLength: UInt32) {
        var result: String = ""
        let randomSubStringCount: Int = Int(randomBelow: randomSubStringCount)

        for _ in 0...randomSubStringCount {
            let subStringLength = Int(randomBelow: randomStringLength) + 1
            result += String(randomWithLength: subStringLength) + " "
        }

        self.init(result)!
    }

    public init(randomWithLength length: Int) {
        let allowedCharsString: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

        self.init(allowedCharsString.characters.sample(size: length)!)
    }

    /// - Returns: `true` if contains any characters other than whitespace or newline characters, else `no`.
    public var isBlank: Bool {
        return stripped().isEmpty
    }

    /// - Returns: The string stripped by whitespace and newline characters from beginning and end.
    public func stripped() -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
}