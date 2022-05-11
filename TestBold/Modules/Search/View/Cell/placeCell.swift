//
//  placeCell.swift
//  TestBold
//
//  Created by bruno cardenas on 10/05/22.
//
import UIKit
protocol placeCellDelegate: AnyObject {
    func showDetail(place:Place)
}
class placeCell: UITableViewCell {

    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    var place:Place?
    var delegate:placeCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func fillData(){
        guard let placeObj = self.place else { return }
        lblType.text = placeObj.location_type
        lblTitle.text = placeObj.title
    }
    @IBAction func onTapCell(_ sender: Any) {
        guard let placeObj = self.place else { return }
        self.delegate?.showDetail(place: placeObj)
    }
}
