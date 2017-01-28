//
//  Catalogo.swift
//  Catalogo e vendas
//
//  Created by Gustavo Luna on 17/01/17.
//  Copyright © 2017 LCODE. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import UserNotifications


class Catalogos
{
    
    
    func incluirCatalogo(Nome: String, Descricao: String )
    {
        /*let appDelegate1 = UIApplication.shared.delegate as! AppDelegate
         
         let context =  appDelegate1.persistentContainer.viewContext*/
        
        let sharedInstance = Empresas()
        
        var empresa_ = [Empresas]()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        let rec = NSEntityDescription.insertNewObject(forEntityName: "Catalogo", into: context)
        
        rec.setValue(Nome, forKey: "Nome")
        rec.setValue(Descricao, forKey: "Descricao")
       
        
        do
        {
            try context.save()
            print ("salvo")
        }
        catch
        {
            
        }
    }
    
    
    
    func RetornarCatalogo()->[catalogoDomain]
    {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        var ListaCatalogo: [catalogoDomain] = [];
        
        //let request = NSFetchRequest<Usuarios>(entityName: "Usuario")
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Catalogo")
        do
        {
            //		 request.predicate = NSPredicate(format: "pk == %@", 1)
            let results = try context.fetch(request)
            if results.count > 0
            {
                for result in results as! [NSManagedObject]
                {
                   // let objectID = () 	managedObjectContext.persistentStoreCoordinator!.managedObjectIDForURIRepresentation(uri)
                    var catalogo = catalogoDomain(nome: "", descricao: "");
                    catalogo.nome = (result.value(forKey: "nome") as? String)!
                    catalogo.descricao = (result.value(forKey: "descricao") as? String)!
                                         //let id = result
                    //print(id)
                    //let objectId:NSManagedObjectID = NSPersistentStoreCoordinator.managedObjectID(uri)
                        //.managedObjectIDForURIRepresentation(uri)
                    ListaCatalogo.append(catalogo)
                    
                }
            }
            return ListaCatalogo;
        }
        catch
        {
            return ListaCatalogo;
        }
        
    }
    
}
