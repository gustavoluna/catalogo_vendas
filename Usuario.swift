        //
        //  Usuario.swift
        //  Catalogo e vendas
        //
        //  Created by Gustavo Luna on 12/01/17.
        //  Copyright © 2017 LCODE. All rights reserved.
        //
        
        import Foundation
        import UIKit
        import CoreData
        import UserNotifications
        
        
        class Usuarios
        {
            
            func logar(_usuario: String, senha: String)-> Bool
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
                    request.predicate = NSPredicate(format: "usu_Nome == %@", _usuario)
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
                            
                            if (username == _usuario && senha == senha)
                            {
                                retorno = true;
                            }
                            else
                            {
                                retorno = false;
                            }
                        }
                    }
                    return retorno;
                }
                catch
                {
                    return false;
                }
                
            }
            
            func registrarUsuario(usuario: String, senha: String)
            {
                /*let appDelegate1 = UIApplication.shared.delegate as! AppDelegate
                 
                 let context =  appDelegate1.persistentContainer.viewContext*/
                
                let sharedInstance = Usuarios()
                
                var usuario = [Usuarios]()
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                
                
                let newuser = NSEntityDescription.insertNewObject(forEntityName: "Usuario", into: context)
                
                newuser.setValue("gluna", forKey: "usu_Nome")
                newuser.setValue("zxc", forKey: "usu_Senha")
                newuser.setValue(1, forKey: "usu_ID")
                
                do
                {
                    try context.save()
                    print ("salvo")
                }
                catch
                {
                    
                }
            }
            
        }
