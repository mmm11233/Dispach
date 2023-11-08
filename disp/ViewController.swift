//
//  ViewController.swift
//  disp
//
//  Created by Mariam Joglidze on 08.11.23.
//
import UIKit
import Foundation


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateFactorials()
    }
    
   private func calculateFactorials() {
        let firstNumber: Int = Int.random(in: 20...50)
        let secondNumber: Int = Int.random(in: 20...50)
        
        var result1: String?
        var result2: String?
        
        let group = DispatchGroup()
        
        group.enter()
        DispatchQueue.global().async(group: group) {
            FactorialCalculator.factorial(firstNumber) { result in
                result1 = result
                group.leave()
            }
        }
        
        group.enter()
        DispatchQueue.global().async(group: group) {
            FactorialCalculator.factorial(secondNumber) { result in
                result2 = result
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            if let result1 = result1, let result2 = result2 {
                if result1 > result2 {
                    print("Thread firts is the winner.")
                } else if result2 > result1 {
                    print("Thread second is the winner.")
                } else {
                    print("It's a tie!")
                }
            }
        }
    }
}

