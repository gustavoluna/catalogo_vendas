//
//  UnidadeMedidaListaController.swift
//  Catalogo e vendas
//
//  Created by Gustavo Luna on 28/01/17.
//  Copyright © 2017 LCODE. All rights reserved.
//

import UIKit
import CoreData

class UnidadeMedidaListaController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Catalogo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
           }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell()
        
        let task  = tasks[indexPath.row]
        
        cell.textLabel?.text = task.nome!
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        if editingStyle == .delete
        {
            let task = tasks[indexPath.row]
            
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do
            {
                tasks = try context.fetch(Catalogo.fetchRequest())
            }
            catch
            {
                print("erro")
            }
        }
        tableView.reloadData()
    }
    
    
   func getData()
   {
    let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    do
    {
        tasks = try context.fetch(Catalogo.fetchRequest())
    }
    catch
    {
        print("erro")
    }
    }
    
}
