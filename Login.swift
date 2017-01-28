//
//  Login.swift
//  Catalogo e vendas
//
//  Created by Gustavo Luna on 12/01/17.
//  Copyright © 2017 LCODE. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Login
{
    
    var _login = "login";
    var _senha = "senha";
    
    var login: String
    {
        get{return _login;}
        set
        {
            _login = newValue;
        }
    }
    
    var senha: String
    {
        get
        {
            return _login;
        }
        set
        {
            _login = newValue;
        }
    }
    
    func Logar(login_: String, senha_ : String)->Bool
    {
        
        var retorno: Bool = false;
        retorno = true;
        
        let appDelegate1 = UIApplication.shared.delegate as! AppDelegate
        
        let context =  appDelegate1.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuario")

        
        
        
        return retorno;
        
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared().delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
