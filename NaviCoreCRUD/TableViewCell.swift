//
//  TableViewCell.swift
//  NaviCoreCRUD
//
//  Created by Vu Thanh Nam on 19/05/2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblUsername: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
