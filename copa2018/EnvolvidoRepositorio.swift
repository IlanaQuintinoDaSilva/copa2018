//
//  EnvolvidosRepositorio.swift
//  copa2018
//
//  Created by Anderson Andreatta on 25/05/18.
//  Copyright © 2018 Anderson Andreatta. All rights reserved.
//

import Foundation
import Alamofire

class EnvolvidoRepository {
    
    let END_POINT = "https://lavajato-aaa7f.firebaseio.com"
    
    func listar(callback: @escaping (DataResponse<[Envolvido]>) -> ()) -> Void {
        
        let url:String = "\(END_POINT)/envolvidos.json"
        
        Alamofire.request(url).responseCollection {
            (response: DataResponse<[Envolvido]>) in
            
            callback(response)
        }
    }
    
    func detalhes(id:Int) {
        let url:String = "\(END_POINT)/envolvidos/\(id).json"
        
        Alamofire.request(url).responseObject {
            (response: DataResponse<Envolvido>) in
            
            let lula:Envolvido = response.result.value!
            
            print(lula.nome)
            print(lula.partido)
            print(lula.prejuizo)
        }
        
    }
    
}

