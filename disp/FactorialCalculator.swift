//
//  main.swift
//  disp
//
//  Created by Mariam Joglidze on 08.11.23.
//

import Foundation

final class FactorialCalculator {
    static func factorial(_ n: Int,  completion: @escaping (String) -> Void) {
        var result = [1]
        for i in 2...n {
            result = result.map { $0 * i }
            result = carryAll(result)
        }

        completion(result.map(String.init).joined())
    }
    
    static func carryAll(_ arr: [Int]) -> [Int] {
        var result = [Int]()

        var carry = 0
        for val in arr.reversed() {
            let total = val + carry
            let digit = total % 10
            carry = total / 10
            result.append(digit)
        }

        while carry > 0 {
            let digit = carry % 10
            carry = carry / 10
            result.append(digit)
        }

        return result.reversed()
    }
}


