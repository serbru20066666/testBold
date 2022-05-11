//
//  SearchView.swift
//  TestBold
//
//  Created by bruno cardenas on 9/05/22.
//

import UIKit
protocol SearchViewDelegate: AnyObject {
    func showDetailView(place:Place)
}
class SearchView: UIViewController {

    @IBOutlet weak var txtPlaceName: UITextField!
    @IBOutlet weak var tb: UITableView!
    weak var delegate: SearchViewDelegate?
    var vm:SearchViewModel?
    var places:[Place]?
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        vm?.delegate = self
        txtPlaceName.addTarget(self, action: #selector(PlaceChange(textField:)), for: .editingChanged)
    }
    func registerCells()
    {
        self.tb.register(UINib(nibName: "placeCell", bundle: nil), forCellReuseIdentifier: "placeCell")
    }
    @objc final private func PlaceChange(textField: UITextField) {
        if textField.text!.count > 2 {
            self.vm?.getPlaces(namePlace: textField.text!)
        } else {
            self.places = nil
            tb.reloadData()
        }
    }
}
extension SearchView: SearchViewModelDelegate {
    func placesReceived(places: [Place]) {
        self.places = places
        self.tb.reloadData()
    }
    
    func error(message: String) {
        self.showAlert(withMessage: message)
    }
}
extension SearchView: placeCellDelegate {
    func showDetail(place:Place) {
        self.delegate?.showDetailView(place: place)
    }
}
