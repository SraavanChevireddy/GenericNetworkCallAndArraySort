//
//  GenericTapeOne.swift
//  GenericTape
//
//  Created by Sraavan Chevireddy on 5/16/21.
//

import Foundation

class GenericCalculator{
    
    func add(_ numOne:Int,_ numTwo:Int)->Int{
        return numOne + numTwo
    }
    
    func add(_ numOne:Double,_ numTwo:Double)->Double{
        return numOne + numTwo
    }
    
    ///
    /// - Parameters:
    ///   - numOne: Generic Var One
    ///   - numTwo: Genric var two
    /// - Returns: Generic Output
    func add<T:Numeric>(_ numOne:T,_ numTwo:T)->T{
        return numOne + numTwo
    }
}

class RangeOperations{
    func join<T:RangeReplaceableCollection>(_ rangeOne:T,_ rangeTwo:T)->T{
        return rangeOne + rangeTwo
    }
    
    /// Returns the sum all the numbers in the given arguments list.
    func add<T:Numeric>(_ numbers:T...){
        print(numbers.reduce(0,+))
    }
    
    func test(){
        join([1,2,3,5], [4,5])
        add(1,2,2,3)
    }
}
