//
//  CatalogoTableViewCell.swift
//  Catalogo e vendas
//
//  Created by Gustavo Luna on 25/01/17.
//  Copyright © 2017 LCODE. All rights reserved.
//
import UIKit

class CatalogoTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let reuseIdentifier = "cell"
    
    // MARK: -
    
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var contentsLabel: UILabel!
    
    // MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
