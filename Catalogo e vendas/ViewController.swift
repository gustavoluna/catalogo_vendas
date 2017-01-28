//
//  ViewController.swift
//  Catalogo e vendas
//
//  Created by Gustavo Luna on 10/01/17.
//  Copyright © 2017 LCODE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    
   
    @IBAction func btn_Entrar(_ sender: UIButton)
    {
        let objUsu = Usuarios();
        
        //bjUsu.registrarUsuario(usuario: "gluna", senha: "zxc159");
        if objUsu.logar(_usuario: txtUsuario.text!, senha: txtSenha.text!)
        {
            performSegue(withIdentifier: "login", sender: self)
        }
        else
        {
            let alertController = UIAlertController(title: "Swiftly Development", message: "You press an incorrect key", preferredStyle: .alert)
            
            self.present(alertController, animated: true, completion:nil)
            
            
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                print("You've pressed OK button");
            }
            
            alertController.addAction(OKAction)       
            
        }
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true);
        
        let documentDirectorPath: String = paths[0]
        
        print (documentDirectorPath);       
                
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

