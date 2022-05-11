//
//  detailCell.swift
//  TestBold
//
//  Created by bruno cardenas on 10/05/22.
//

import UIKit

class detailCell: UITableViewCell {

    @IBOutlet weak var lblMaxTemp: UILabel!
    @IBOutlet weak var lblMintemp: UILabel!
    @IBOutlet weak var lblDay: UILabel!
    var obj:ConsolidatedWeather?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func fillData() {
        guard let data = obj else { return }
        lblDay.text = data.created
        lblMaxTemp.text = String(format: "%.3f", data.maxTemp ?? 0.0)
        lblMintemp.text = String(format: "%.3f", data.minTemp ?? 0.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
