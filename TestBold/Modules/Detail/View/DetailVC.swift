//
//  DetailVC.swift
//  TestBold
//
//  Created by bruno cardenas on 10/05/22.
//

import UIKit
protocol DetailVCDelegate: AnyObject {
    func dismiss()
}
class DetailVC: UIViewController {

    @IBOutlet weak var tb: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    var place:Place?
    var vm:DetailViewModel?
    var delegate:DetailVCDelegate?
    var weathers:[ConsolidatedWeather]?
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        fillData()
    }
    func fillData() {
        guard let placeObj = self.place else { return }
        lblTitle.text = placeObj.title
        self.vm?.delegate = self
        self.vm?.getDetail(woid: String(placeObj.woeid ?? 0))
    }
    func registerCells()
    {
        self.tb.register(UINib(nibName: "detailCell", bundle: nil), forCellReuseIdentifier: "detailCell")
    }
    @IBAction func OnTapClose(_ sender: Any) {
        self.delegate?.dismiss()
    }
}
extension DetailVC: DetailViewModelDelegate {
    func detailReceived(detail: PlaceDetail) {
        self.weathers = detail.consolidatedWeather
        tb.reloadData()
    }
    
    func error(message: String) {
        self.showAlert(withMessage: message)
    }
    
    
}
extension DetailVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? detailCell else  {
            fatalError("error guard indexPath")
        }
        cell.obj = self.weathers![indexPath.row]
        cell.fillData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
