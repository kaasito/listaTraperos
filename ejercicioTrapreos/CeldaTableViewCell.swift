//
//  CeldaTableViewCell.swift
//  ejercicioTrapreos
//
//  Created by Lucas Romero Magaña on 19/1/22.
//

import UIKit

class CeldaTableViewCell: UITableViewCell {

    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var pic: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
