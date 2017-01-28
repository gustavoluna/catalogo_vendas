//
//  PrincipalController.swift
//  Catalogo e vendas
//
//  Created by Gustavo Luna on 13/01/17.
//  Copyright © 2017 LCODE. All rights reserved.
//

import UIKit

class PrincipalController: UIViewController {

    var MenuShow = false;
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnMenu(_ sender: Any)
    {
        if MenuShow == false
        {
            leadingConstraint.constant = 0;
            MenuShow = true;
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
        }
        else
        {
            leadingConstraint.constant = -140;
            MenuShow = false;
        }
    }
    @IBAction func btn_Config(_ sender: UIButton)
    {
        //performSegue(withIdentifier: "sg_config", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
