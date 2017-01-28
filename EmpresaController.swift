//
//  EmpresaController.swift
//  Catalogo e vendas
//
//  Created by Gustavo Luna on 15/01/17.
//  Copyright © 2017 LCODE. All rights reserved.
//

import UIKit

class EmpresaController: UIViewController {

    @IBOutlet weak var txtCelular: UITextField!
    @IBOutlet weak var txtTelefone: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtNomeEmpresa: UITextField!
    
    @IBOutlet weak var txtDescricao: UITextField!
    @IBAction func btn_gravar(_ sender: Any)
    {
        let objEmpresa = Empresas();
        
        objEmpresa.incluirEmpresa(NomeEmpresa: txtNomeEmpresa.text!, EmailEmpresa: txtEmail.text!, Telefone: txtTelefone.text!, Celular: txtCelular.text!, Descricao: txtDescricao.text! );
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
