//
//  main.swift
//  disp
//
//  Created by Mariam Joglidze on 08.11.23.
//

import Foundation

class FactorialCalculator {
    static func factorial(of number: Int, completion: @escaping (Int) -> Void) {
        var result = 1
        for i in 1...number {
            result *= i
        }
        completion(result)
    }
}


