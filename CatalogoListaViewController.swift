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

    extension Notification.Name {
        static let reload = Notification.Name("reload")
    }
    
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
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableData(_:)), name: .reload, object: nil)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    func reloadTableData(_ notification: Notification) {
        //tableView.reloadData();
        //reloadData()
        tableView.dataSource = self
        Listacatalogo = OCatalogo.RetornarCatalogo();//OCatalogo.RetornarCatalogo();
        tableView.reloadData()
        
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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
       let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if editingStyle == .delete
        {
            let task = Listacatalogo[indexPath.row]
          //  context.delete(NSManagedObject<catalogoDomain>)
            
            tableView.reloadData()

           // reloadTableData(notif)
        }
    }
    
    /*novo*/
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            tableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        case .delete:
            tableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        case .move:
            break
        case .update:
            break
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .fade)
        case .move:
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    //fim
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue"{
            if let dtViewController = segue.destination as? CatalogoDetalheViewController{
                if let indexPath = tableView.indexPath(for: sender as! UITableViewCell){
                    dtViewController.dadosDetail = Listacatalogo[indexPath.row] as catalogoDomain
                    dtViewController.index = indexPath.row;
                   // dtViewController.listaCatalogoEdit = Listacatalogo;
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
    extension ViewController: NSFetchedResultsControllerDelegate {
    }
