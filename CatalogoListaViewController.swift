	//
//  CatalogoListaViewController.swift
//  Catalogo e vendas
//
//  Created by Gustavo Luna on 19/01/17.
//  Copyright © 2017 LCODE. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class CatalogoListaViewController: UIViewController,UITableViewDataSource {
    
   
    //class CatalogoListaViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
   
    
    private let segueEditQuoteViewController = "detailSegue"
    var Listacatalogo = [catalogoDomain]();
    var OCatalogo = Catalogos();
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        Listacatalogo = OCatalogo.RetornarCatalogo();//OCatalogo.RetornarCatalogo();
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //bailoni
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return Listacatalogo.count;
        
    }
    //context bailoni
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    //bailoni
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        let dados = Listacatalogo[indexPath.row] as catalogoDomain//objcatalogo[indexPath.row] as Catalogos
        cell.textLabel?.text = dados.nome
        cell.detailTextLabel?.text = dados.descricao
        
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue"{
            if let dtViewController = segue.destination as? CatalogoDetalheViewController{
                if let indexPath = tableView.indexPath(for: sender as! UITableViewCell){
                    dtViewController.dadosDetail = Listacatalogo[indexPath.row] as catalogoDomain
                }
            }
        }
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
