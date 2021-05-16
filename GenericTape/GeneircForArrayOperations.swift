//
//  GeneircForArrayOperations.swift
//  GenericTape
//
//  Created by Sraavan Chevireddy on 5/16/21.
//

import Foundation

public protocol Mockable{
    associatedtype Element
    static var mockData : [Element] {get}
}


/// To compare any two items in a struct. Xcode have an inbuilt property called `Comparable`. This will autogenerate a stub for you.

struct SampleOne : Mockable, Comparable{
    
    /// If we do this and have the struct confirm to Comparable protocol. Sorting will be done at class level rather than doing it in the struct level. Main function will have it called with name `sorted`.
    static func < (lhs: SampleOne, rhs: SampleOne) -> Bool {
        return lhs.employeeDetails < rhs.employeeDetails
    }
    
    var employeeDetails : String
    
    public static var mockData: [SampleOne]{
        return [
            SampleOne(employeeDetails: "Emp 2"),
            SampleOne(employeeDetails: "Emp 1")
        ]
    }
}

struct SampleTwo : Mockable,Comparable{
    
    static func < (lhs: SampleTwo, rhs: SampleTwo) -> Bool {
        return lhs.employerDetails < rhs.employerDetails
    }
    
    var employerDetails : String
    
    public static var mockData: [SampleTwo]{
        return [
            SampleTwo(employerDetails: "EmpR 2"),
            SampleTwo(employerDetails: "EmpR 1")
        ]
    }
}

class ArrayGenerics{
    
    
    /// This is the generic array to sort different arrays and different properties.
    /// - Parameter completeion: returns the sorted items from the class level rather than getting from the struct level.
    func genericArraySort<T:Mockable & Comparable>(completeion: @escaping( ([T])->Void)){
        if let data = T.mockData as? [T]{
            completeion(data.sorted())
        }else{
            completeion([])
        }
    }
    
    func test(){
        
        genericArraySort { (arr: [SampleOne]) in
            print(arr) // This will have the elements already sorted as defined in the struct `SampleOne` itself.
        }
        
        genericArraySort { (arr:[SampleTwo]) in
            print(arr) // This will have the elements sorted as defined in struct `SampleTwo` itself.
        }
        
    }
        
}

