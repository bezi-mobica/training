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
            let subStringLength = UInt32(Int(randomBelow: randomStringLength) + 1)
            result += String(randomWithLength: subStringLength) + " "
        }

        self.init(result)
    }

    public init(randomWithLength length: UInt32) {
        let allowedCharsString: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

        self.init(allowedCharsString.sample(size: length))
    }

    public var isBlank: Bool {
        return stripped().isEmpty
    }

    public func stripped() -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    public var sample: Character? {
        return isEmpty ? nil : self[index(startIndex, offsetBy: Int(randomBelow: UInt32(count)))]
    }
    
    public func sample(size: UInt32) -> String {
        if isEmpty {
            return String()
        }
        
        var sampleElements = String()
        
        for _ in 0..<size {
            sampleElements.append(sample!)
        }
        
        return sampleElements
    }
}
