//
//  EdicaoSelecaoTableViewController.swift
//  copa2018
//
//  Created by Anderson Andreatta on 12/05/18.
//  Copyright © 2018 Anderson Andreatta. All rights reserved.
//

import UIKit

class EdicaoSelecaoTableViewController: UITableViewController,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {
    
    @IBOutlet var tfNome: UITextField!
    @IBOutlet var tfQuantTitulo: UITextField!
    @IBOutlet var imFoto: UIImageView!
    
    var picker:UIImagePickerController!
    
    var acao:String = "INCLUIR"
    var selecao:Selecao!
    var repositorio:SelecaoRepositorio = SelecaoRepositorio()
    
    var jr:JogadorRepositorio = JogadorRepositorio()
    
    var ir:ImageRepository = ImageRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker = UIImagePickerController()
        self.picker.delegate = self
        
        if self.acao == "INCLUIR" {
            self.selecao = repositorio.novaInstancia()
            self.selecao.foto = "placeholde"
            
            self.selecao.jogadores = []
            
            let j1:Jogador = jr.novaInstancia()
            j1.nome = "Neymar"
            
            self.selecao.jogadores?.adding(j1)
        }
        
        if self.acao == "ALTERAR" {
            self.tfNome.text = self.selecao.nome
            self.tfQuantTitulo.text = "99"
            
            //TODO: carregar a imagem!
            self.imFoto.image = ir.load(self.selecao.foto!)
            
            //self.selecao.jogadores = []
            
            let j1:Jogador = jr.novaInstancia()
            j1.nome = "Neymar"
            j1.selecao = self.selecao
            
            self.selecao.jogadores?.adding(j1)
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    @IBAction func trocarImagem(_ sender: AnyObject) {
        self.picker.allowsEditing = false
        self.picker.sourceType = .photoLibrary
        
        self.present(self.picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image:UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            self.imFoto.image = image
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func salvar(_ sender: AnyObject) {
        
        self.selecao.nome = self.tfNome.text
        self.selecao.quantTitulos = self.tfQuantTitulo.text!
        
        self.selecao.foto = self.selecao.nome
        
        ir.save(imFoto.image!, name: self.selecao.foto!)
        
        repositorio.salvar()
        
        self.dismiss(animated: true, completion: nil)
    }
}
