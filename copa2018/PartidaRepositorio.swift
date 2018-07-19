//
//  PartidaRepositorio.swift
//  copa2018
//
//  Created by Anderson Andreatta on 23/06/18.
//  Copyright © 2018 Anderson Andreatta. All rights reserved.
//

import Foundation
import Alamofire

class PartidaRepositorio {
    
    let END_POINT = "https://copa2018-5d3d0.firebaseio.com"
    
    func listar(callback: @escaping (DataResponse<[Partida]>) -> ()) {
        
        let url:String = "\(END_POINT)/partidas.json"
        
        Alamofire.request(url).responseCollection {
            (response: DataResponse<[Partida]>) in
            
            callback(response)
        }
        
    }
    
}
