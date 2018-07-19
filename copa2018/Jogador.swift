//
//  Jogador.swift
//  copa2018
//
//  Created by Anderson Andreatta on 25/05/18.
//  Copyright © 2018 Anderson Andreatta. All rights reserved.
//

import Foundation
import CoreData

class Jogador: NSManagedObject {
    
    @NSManaged var nome:String?
    @NSManaged var selecao:Selecao?
    
}
