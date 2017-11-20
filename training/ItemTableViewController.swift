//
//  ItemTableViewController.swift
//  training
//
//  Created by Benedykt Ziobro on 07/11/2017.
//  Copyright © 2017 Benedykt Ziobro. All rights reserved.
//

import UIKit
import Dispatch

class ItemTableViewController: UITableViewController {

    let celIdentifier = "ItemTableViewCell"

    var work: DispatchWorkItem? = nil
    var items: [String] = Array(repeating: "", count: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0

        getItems()
    }

    private func getItems() {
        let alert = UIAlertController(title: "Connecting", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        self.present(alert, animated: true)

        Items.getJson(jsonHandler: { json in
            DispatchQueue.main.async {
                self.items = Items.init(items: json).items
                self.tableView.reloadData()
                alert.dismiss(animated: true)
            }
        })
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCell = tableView.dequeueReusableCell(withIdentifier: celIdentifier, for: indexPath)

        guard let cell = currentCell as? ItemTableViewCell else {
            NSLog("Cell is wrong type. Should be the \(celIdentifier)")
            return currentCell
        }

        cell.IdLabel.text = String(indexPath.row + 1)
        cell.TextLabel.text = items[indexPath.row]

        return cell
    }

    private func generateData() {
        for index in items.indices {
            items[index] = String(randomSubStringCount: 10, randomStringLength: 10)
        }
    }

    override func becomeFirstResponder() -> Bool {
        return true
    }

    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            getItems()
        }
    }
}
