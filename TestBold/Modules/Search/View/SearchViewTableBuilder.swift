//
//  SearchViewTableBuilder.swift
//  TestBold
//
//  Created by bruno cardenas on 10/05/22.
//

import UIKit

extension SearchView: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.places?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath) as? placeCell else  {
            fatalError("error guard indexPath")
        }
        cell.delegate = self
        cell.place = self.places![indexPath.row]
        cell.fillData()
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
