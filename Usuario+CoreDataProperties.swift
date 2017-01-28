//
//  Usuario+CoreDataProperties.swift
//  Catalogo e vendas
//
//  Created by Gustavo Luna on 12/01/17.
//  Copyright © 2017 LCODE. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Usuario {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Usuario> {
        return NSFetchRequest<Usuario>(entityName: "Usuario");
    }

    @NSManaged public var usu_ID: Int32
    @NSManaged public var usu_Nome: String?
    @NSManaged public var usu_Senha: String?

}
