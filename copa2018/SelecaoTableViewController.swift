//
//  SelecaoTableViewController.swift
//  copa2018
//
//  Created by Anderson Andreatta on 12/05/18.
//  Copyright © 2018 Anderson Andreatta. All rights reserved.
//

import UIKit

class SelecaoTableViewController: UITableViewController {

    var repositorio:SelecaoRepositorio = SelecaoRepositorio()
    
    var ir:ImageRepository = ImageRepository()
    
    var selecoes:Array<Selecao> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.selecoes = self.repositorio.consultar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.selecoes = self.repositorio.consultar()
        
        self.tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.selecoes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let indice:Int = indexPath.row
        let selecao:Selecao = self.selecoes[indice]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "selecao", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = selecao.nome
        cell.detailTextLabel?.text = "\(selecao.quantTitulos!) títulos"
        
        cell.imageView?.image = ir.load(selecao.foto!)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let indice = indexPath.row
        let selecaoSelecionada = self.selecoes[indice]
        
        let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
    
        let destino:DetalhesSelecaoTabBarViewController =
            storyBoard.instantiateViewController(withIdentifier: "detalhesSelecao") as! DetalhesSelecaoTabBarViewController
        
        destino.selecao = selecaoSelecionada
        destino.acao = "ALTERAR"
        
        if let jogadores = selecaoSelecionada.jogadores {
            print("Quant X jogadores \(jogadores.count)")
        }
        
        self.present(destino, animated: true, completion: nil)
        
        //self.navigationController?.pushViewController(destino, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let indice = indexPath.row
        let selecao = self.selecoes[indice]
        
        if editingStyle == .delete {
            self.repositorio.excluir(selecao: selecao)
            
            self.selecoes = self.repositorio.consultar()
            self.tableView.reloadData()
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
