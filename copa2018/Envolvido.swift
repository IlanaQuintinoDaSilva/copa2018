//
//  Envolvido.swift
//  copa2018
//
//  Created by Anderson Andreatta on 25/05/18.
//  Copyright © 2018 Anderson Andreatta. All rights reserved.
//

import Foundation

final class Envolvido:ResponseObjectSerializable, ResponseCollectionSerializable {
    
    var nome:String!
    var partido:String!
    var prejuizo:Double!
    
    required init?(response: HTTPURLResponse, representation: Any) {
        
        let representation = representation as? [String: Any]
        
        self.nome = representation?["nome"] as! String
        self.partido = representation?["partido"] as! String
        self.prejuizo = representation?["prejuizo"] as! Double
    }
    
    static func collection(from response: HTTPURLResponse, withRepresentation representation: Any) -> [Envolvido] {
        
        var envolvidos:Array<Envolvido> = []
        
        if let representation = representation as? [[String: Any]] {
            for itemRepresentation in representation {
                if let envolvido = Envolvido(response: response, representation: itemRepresentation) {
                    envolvidos.append(envolvido)
                }
            }
        }
        return envolvidos
    }
    
    init() {
        
    }
    
}

