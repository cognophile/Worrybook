//
//  QuoteHelper.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class QuoteHelper {
    public static func getRandomQuote() -> String {
        let random = Int.random(in: 1..<6)

        switch random {
        case 1:
            return "You will smile again"
        case 2:
            return "Be kind to yourself"
        case 3:
            return "It's ok not to be ok"
        case 4:
            return "Your struggle need not be silent"
        case 5:
            return "Tough times create tough people"
        default:
            return "Time heals all wounds"
        }
    }
}
