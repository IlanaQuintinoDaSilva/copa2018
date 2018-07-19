//
//  JogadorRepositorio.swift
//  copa2018
//
//  Created by Anderson Andreatta on 25/05/18.
//  Copyright © 2018 Anderson Andreatta. All rights reserved.
//

import Foundation

import Foundation
import CoreData
import UIKit

class JogadorRepositorio {
    
    var contexto:NSManagedObjectContext
    
    init() {
        self.contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func novaInstancia() -> Jogador {
        let pessoa = NSEntityDescription.insertNewObject(forEntityName: "Jogador", into: contexto) as! Jogador
        
        return pessoa
    }
    
    func listar() -> [Jogador] {
        let pessoas:Array<Jogador>
        
        let requisicao: NSFetchRequest<NSFetchRequestResult> = Jogador.fetchRequest()
        
        do {
            pessoas = try self.contexto.fetch(requisicao) as! [Jogador]
        } catch _ {
            pessoas = []
        }
        
        return pessoas
    }
    
    func salvar() -> Void {
        do {
            try self.contexto.save()
        } catch _ {
            //Tratar problema...
        }
    }
    
    func remover(jogador:Jogador) -> Void {
        self.contexto.delete(jogador)
    }
}

