//
//  Selecao.swift
//  copa2018
//
//  Created by Anderson Andreatta on 12/05/18.
//  Copyright © 2018 Anderson Andreatta. All rights reserved.
//

import Foundation
import CoreData

class Selecao: NSManagedObject {
    
    @NSManaged var nome:String!
    @NSManaged var foto:String?
    @NSManaged var quantTitulos:String!
    @NSManaged var jogadores:NSSet?


}
