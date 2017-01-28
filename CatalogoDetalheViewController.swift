//
//  CatalogoDetalheViewController.swift
//  Catalogo e vendas
//
//  Created by Gustavo Luna on 20/01/17.
//  Copyright © 2017 LCODE. All rights reserved.
//

import UIKit
import CoreData

class CatalogoDetalheViewController: UIViewController {

    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtDescricao: UITextField!
    private let segueEditQuoteViewController = "detailSegue";
    var managedObjectContext: NSManagedObjectContext?
    
    var dadosDetail: catalogoDomain?
    
    @IBAction func btnAlterar(_ sender: Any)
    {
        //guard let managedObjectContext = managedObjectContext else { return }

        var managedObjectContext: NSManagedObjectContext?
        if let dadosDetail = dadosDetail {
            // Configure Quote
            dadosDetail.nome = txtNome.text!;
            dadosDetail.descricao = txtDescricao.text!;
            
            // Pop View Controller_ = navigationController?.popViewController(animated: true)
            // Pop View Controller
            _ = navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        if let dadosDetail = dadosDetail
        {
            title = dadosDetail.nome
            txtNome.text = dadosDetail.nome
            txtDescricao.text = dadosDetail.descricao
        }

        // Do any additional setup after loading the view.
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
