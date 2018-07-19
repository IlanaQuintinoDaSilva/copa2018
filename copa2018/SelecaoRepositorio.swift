//
//  SelecaoRepositorio.swift
//  copa2018
//
//  Created by Anderson Andreatta on 12/05/18.
//  Copyright © 2018 Anderson Andreatta. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class SelecaoRepositorio {
    
    static var selecoes:Array<Selecao> = []
    
    var contexto:NSManagedObjectContext
    
    init() {
        self.contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func novaInstancia() -> Selecao {
        let selecao = NSEntityDescription.insertNewObject(forEntityName: "Selecao", into: contexto) as! Selecao
        
        return selecao
    }
    
    func consultar() -> [Selecao] {
        let selecoes:Array<Selecao>
        
        let requisicao: NSFetchRequest<NSFetchRequestResult> = Selecao.fetchRequest()
        
        do {
            selecoes = try self.contexto.fetch(requisicao) as! [Selecao]
        } catch _ {
            selecoes = []
        }
        
        return selecoes
    }
    
    func salvar() -> Void {
        do {
            try self.contexto.save()
        } catch _ {
            //Tratar problema...
        }
    }
    
    func excluir(selecao:Selecao) -> Void {
        self.contexto.delete(selecao)
    }
    
}
