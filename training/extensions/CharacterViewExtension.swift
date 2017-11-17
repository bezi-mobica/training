//
// Created by Benedykt Ziobro on 13/11/2017.
// Copyright (c) 2017 Benedykt Ziobro. All rights reserved.
//

import Foundation

extension String.CharacterView {
    /// Returns a random character from the `CharacterView`.
    ///
    /// - Returns: A random character from the `CharacterView` or `nil` if empty.
    public var sample: Character? {
        return isEmpty ? nil : self[index(startIndex, offsetBy: Int(randomBelow: UInt32(count)))]
    }

    public func sample(size: UInt32) -> String.CharacterView {
        if isEmpty {
            return String.CharacterView()
        }

        var sampleElements = String.CharacterView()

        for _ in 0..<size {
            sampleElements.append(sample!)
        }

        return sampleElements
    }
}
