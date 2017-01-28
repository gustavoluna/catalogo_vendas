//
//  Empresa.swift
//  Catalogo e vendas
//
//  Created by Gustavo Luna on 15/01/17.
//  Copyright © 2017 LCODE. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import UserNotifications

class Empresas
{
    /*var nomeEmpresa_:String;
    var EmailEmpresa_: String;
    var TelefoneEmpresa_: String
    var CelularEmpresa_: String
    
    var nomeEmpresa:String
    {
        get
        {
            return nomeEmpresa_
        }
        set (Valor)
        {
            nomeEmpresa_ = Valor
        }
    }
    
    var emailEmpresa:String
        {
        get
        {
            return EmailEmpresa_
        }
        set (Valor)
        {
            EmailEmpresa_ = Valor
        }
    }
    
    var TelefoneEmpresa:String
        {
        get
        {
            return TelefoneEmpresa_
        }
        set (Valor)
        {
            TelefoneEmpresa_ = Valor
        }
    }
    
    var CelularEmpresa:String
        {
        get
        {
            return CelularEmpresa_
        }
        set (Valor)
        {
            CelularEmpresa_ = Valor
        }
    }
    
    init (){
        self.nomeEmpresa = ""
        self.TelefoneEmpresa = ""
        self.CelularEmpresa = ""
        self.emailEmpresa = ""
    }*/
    
    
    
    func incluirEmpresa(NomeEmpresa: String, EmailEmpresa: String, Telefone: String, Celular: String, Descricao: String  )
    {
        /*let appDelegate1 = UIApplication.shared.delegate as! AppDelegate
         
         let context =  appDelegate1.persistentContainer.viewContext*/
        
        let sharedInstance = Empresas()
        
        var empresa_ = [Empresas]()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        let rec = NSEntityDescription.insertNewObject(forEntityName: "Empresa", into: context)
        
        rec.setValue(NomeEmpresa, forKey: "Nome_Empresa")
        rec.setValue(EmailEmpresa, forKey: "email_Empresa")
        rec.setValue(Telefone, forKey: "telefone_Empresa")
        rec.setValue(Celular, forKey: "celular_Empresa")
        rec.setValue(Descricao, forKey: "descricao_Empreesa")
        
        
        do
        {
            try context.save()
            print ("salvo")
        }
        catch
        {
            
        }
    }
    
    /*func RetornarEmpresa()->Empresas
    {
        let sharedInstance = Usuarios()
        var retorno = false;
        var usuario = [Usuarios]()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        var username = "";
        var senha = "";
        
        //let request = NSFetchRequest<Usuarios>(entityName: "Usuario")
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuario")
        do
        {
            request.predicate = NSPredicate(format: "pk == %@", 1)
            let results = try context.fetch(request)
            if results.count > 0
            {
                for result in results as! [NSManagedObject]
                {
                    username = (result.value(forKey: "usu_Nome") as? String)!
                    senha = (result.value(forKey: "usu_Senha") as? String)!
                    /*if username ==  (result.value(forKey: "usu_Nome") as? String)!
                     {
                     print (username);
                     }
                     if  senha == result.value(forKey: "usu_Senha") as? String
                     {
                     print (senha);
                     }*/
                    
                                   }
            }
            return retorno;
        }
        catch
        {
            return false;
        }
        
    }*/

}
