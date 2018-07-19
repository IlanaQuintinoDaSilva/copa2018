//
//  EnvolvidosTableViewController.swift
//  copa2018
//
//  Created by Anderson Andreatta on 25/05/18.
//  Copyright © 2018 Anderson Andreatta. All rights reserved.
//

import UIKit
import Alamofire
import SwiftSpinner

class EnvolvidosTableViewController: UITableViewController {
    
    var repository:EnvolvidoRepository = EnvolvidoRepository()
    var dados:Array<Envolvido> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dados = []
        self.tableView.reloadData()
        
        SwiftSpinner.show("Carregando")
        self.repository.listar(callback: self.deuCerto)
    }
    
    func deuCerto(response:DataResponse<[Envolvido]>) {
        SwiftSpinner.hide()
        
        self.dados = response.result.value!
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dados.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        let envolvido:Envolvido = self.dados[index]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "envolvido", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = envolvido.nome
        cell.detailTextLabel?.text = envolvido.partido
        
        return cell
    }
    
}
