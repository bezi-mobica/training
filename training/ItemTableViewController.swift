//
//  ItemTableViewController.swift
//  training
//
//  Created by Benedykt Ziobro on 07/11/2017.
//  Copyright © 2017 Benedykt Ziobro. All rights reserved.
//

import UIKit
import HandySwift
import Dispatch

class ItemTableViewController: UITableViewController {

    let celIdentifier = "ItemTableViewCell"

    var work: DispatchWorkItem? = nil
    var items: [String] = Array(repeating: "", count: 10)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0
        generateData()

        work = DispatchWorkItem(block: {
            let randomIndex = Int(randomBelow: 10)
            self.items[randomIndex!] = String(randomSubStringCount: 10, randomStringLength: 10)
            self.triggerTask()

            NSLog("Restarting work ")

            DispatchQueue.main.async {
                let indexPath = IndexPath(row: randomIndex!, section: 0)
                self.tableView.reloadRows(at: [indexPath], with: .none)
            }
        })
        
        NSLog("Starting work ")
        triggerTask()
    }

    override func viewWillDisappear(_ animated: Bool) {
        work?.cancel()
        NSLog("Stoping work ")
        super.viewWillDisappear(animated)
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

    private func triggerTask() {
        if work != nil {
            delay(by: .milliseconds(250), work!)
        }
    }
}
