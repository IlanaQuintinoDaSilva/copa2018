//
//  PartidasTableViewController.swift
//  copa2018
//
//  Created by Anderson Andreatta on 23/06/18.
//  Copyright © 2018 Anderson Andreatta. All rights reserved.
//

import UIKit
import Alamofire
import SwiftSpinner

class PartidasTableViewController: UITableViewController {
    
    var repositorio:PartidaRepositorio = PartidaRepositorio()
    var partidas:Array<Partida> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SwiftSpinner.show("Buscando as partidas...")
        repositorio.listar(callback: self.deuCerto)
    }
    
    func deuCerto(response:DataResponse<[Partida]>) {
        
        SwiftSpinner.hide()
        
        self.partidas = response.result.value!
        self.tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.partidas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let indice = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "partidaCell", for: indexPath) as! PartidaTableViewCell

        // Configure the cell...
        let partida:Partida = self.partidas[indice]
        
        cell.selecao1.text = partida.selecao1
        cell.selecao2.text = partida.selecao2
        cell.total.text = partida.resultado
        

        return cell
    }
}
