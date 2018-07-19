//
//  DetalhesSelecaoTabBarViewController.swift
//  copa2018
//
//  Created by Anderson Andreatta on 25/05/18.
//  Copyright © 2018 Anderson Andreatta. All rights reserved.
//

import UIKit

class DetalhesSelecaoTabBarViewController: UITabBarController {
    
    var acao:String = "INCLUIR"
    var selecao:Selecao!

    override func viewDidLoad() {
        super.viewDidLoad()

        var edicao:EdicaoSelecaoTableViewController =  self.childViewControllers[0] as! EdicaoSelecaoTableViewController
        
        edicao.acao = self.acao
        edicao.selecao = self.selecao
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fechar(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
