//
//  Partida.swift
//  copa2018
//
//  Created by Anderson Andreatta on 23/06/18.
//  Copyright © 2018 Anderson Andreatta. All rights reserved.
//

import Foundation

final class Partida:ResponseObjectSerializable, ResponseCollectionSerializable {
    
    var selecao1:String!
    var selecao2:String!
    var data:String!
    var estadio:String!
    var resultado:String!
    
    required init?(response: HTTPURLResponse, representation: Any) {
        
        let representation = representation as? [String: Any]
        
        self.selecao1 = representation?["selecao1"] as! String
        self.selecao2 = representation?["selecao2"] as! String
        self.data = representation?["data"] as! String
        self.estadio = representation?["estadio"] as! String
        self.resultado = representation?["resultado"] as! String
    }
    
    static func collection(from response: HTTPURLResponse, withRepresentation representation: Any) -> [Partida] {
        
        var partidas:Array<Partida> = []
        
        if let representation = representation as? [[String: Any]] {
            for itemRepresentation in representation {
                if let partida = Partida(response: response, representation: itemRepresentation) {
                    partidas.append(partida)
                }
            }
        }
        return partidas
    }
    
    init() {
        
    }

    
}
