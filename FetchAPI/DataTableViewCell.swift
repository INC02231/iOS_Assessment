//
//  TableViewCell.swift
//  FetchAPI
//
//  Created by Incture on 09/04/23.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    static let reuseIdentifier = "DataTableViewCell"
    
    @IBOutlet weak var uview: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var id: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.uview.layer.cornerRadius = 15.0
        self.uview.layer.shadowColor = UIColor.black.cgColor
        self.uview.layer.shadowOpacity = 0.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
