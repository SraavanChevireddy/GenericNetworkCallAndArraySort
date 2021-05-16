//
//  GenericForNetworkCall.swift
//  GenericTape
//
//  Created by Sraavan Chevireddy on 5/16/21.
//

import Foundation


struct ComDetails : Codable{
    var name, comName, age: String
}

class makeServiceCall{
    
    func genericServiceCall<T:Decodable>(completion: @escaping(T)->Void){
        let encodable = try? JSONEncoder().encode(ComDetails(name: "Name", comName: "ComName", age: "10"))
         completion(try! JSONDecoder().decode(T.self, from: encodable!))
    }
    
    // You can cast it as ComDetails or [ComDetails]
    func test(){
        genericServiceCall { (com:ComDetails) in
            print("This is the expected output")
        }
    }
    
    func testTwo(){
        genericServiceCall { (com:[ComDetails]) in
            print("The output wil be the array of details now.")
        }
        
    }
    
    
}
