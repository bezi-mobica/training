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
    var items: [String] = Array(repeating: "", count: 10)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0
        generateData()
        initWork()

        NotificationCenter.default.addObserver(
                self,
                selector: #selector(appBecomeActive(_:)),
                name: NSNotification.Name.UIApplicationDidBecomeActive,
                object: nil)

        NotificationCenter.default.addObserver(
                self,
                selector: #selector(appGoBackground(_:)),
                name: NSNotification.Name.UIApplicationDidEnterBackground,
                object: nil)

        triggerTask()
    }

    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
        work?.cancel()
        work = nil
        super.viewDidDisappear(animated)
    }

    private func initWork() {
        work = DispatchWorkItem(block: {
            let randomIndex = Int(randomBelow: 10)
            self.items[randomIndex] = String(randomSubStringCount: 10, randomStringLength: 10)
            self.triggerTask()

            NSLog("Trigger task again")

            DispatchQueue.main.async {
                let indexPath = IndexPath(row: randomIndex, section: 0)
                self.tableView.beginUpdates()

                if let cell = self.tableView.cellForRow(at: indexPath) as? ItemTableViewCell {
                    cell.TextLabel.text = self.items[randomIndex]
                }

                self.tableView.endUpdates()
            }
        })
    }

    @objc func appGoBackground(_ notification: NSNotification) {
        work?.cancel()
        work = nil
    }

    @objc func appBecomeActive(_ notification: NSNotification) {
        triggerTask()
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
        if work == nil {
            initWork()
        }

        if let task = work {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: task)
        }
    }
}
