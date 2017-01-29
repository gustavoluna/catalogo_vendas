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
    var managedContext: NSManagedObjectContext!
    var currentBowtie: Catalogo!
    var index: Int?
    var dadosDetail: catalogoDomain?
    var listaCatalogoEdit : [Catalogo] = []
     var tasks : [Catalogo] = []
    
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

    
    @IBAction func btnGravar(_ sender: Any)
    {
        /*let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
       
            let task = tasks[index]
            
            try context.save(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do
            {
                tasks = try context.fetch(Catalogo.fetchRequest())
            }
            catch
            {
                print("erro")
            }*/
        let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do
        {
            tasks = try context.fetch(Catalogo.fetchRequest())
            let user = tasks[index!]

        }
        catch
        {
            print("erro")
        }

        
        
        

        //let context = getContext()
        //let fetchRequest: NSFetchRequest<Catalogo> = Catalogo.fetchRequest()
       /* let context = getContext()
        let fetchRequest: NSFetchRequest<Catalogo> = Catalogo.fetchRequest()
        
        do {
            let array_users = try getContext().fetch(fetchRequest)
            let user = array_users[index]
            
            user.setValue(txtNome.text, forKey: "nome")
            user.setValue(txtDescricao.text, forKey: "descricao")
            
           // print("\(user.value(forKey: "email"))")
           // context.save(user)
            //save the context
            do
            {
                try context.save()
                print("saved!")
            }
            catch let error as NSError
            {
                print("Could not save \(error), \(error.userInfo)")
            }
            catch {
                
            }
            
        } catch {
            print("Error with request: \(error)")
        }*/
        
        self.dismiss(animated: true, completion: nil)
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
        if let index = index
        {
            
            print(index)
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
