//
//  CatalogoAddViewController.swift
//  Catalogo e vendas
//
//  Created by Gustavo Luna on 17/01/17.
//  Copyright © 2017 LCODE. All rights reserved.
//

import UIKit

class CatalogoAddViewController: UIViewController {

    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtDescricao: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnGravar(_ sender: Any) {
        
        let objCatalogos = Catalogos();
        objCatalogos.incluirCatalogo(Nome: txtNome.text!, Descricao: txtDescricao.text!);
         NotificationCenter.default.post(name: .UIDeviceBatteryLevelDidChange, object: nil)
        
        NotificationCenter.default.post(name: .reload, object: nil)
        _ = navigationController?.popViewController(animated: true)
        
        //NotificationCenter.defaultCenter().postNotificationName("load", object: nil)
       
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
