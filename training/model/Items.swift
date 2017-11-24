//
// Created by Benedykt Ziobro on 15/11/2017.
// Copyright (c) 2017 Benedykt Ziobro. All rights reserved.
//

import Foundation


struct Items: Codable {
    var items: [String]
}

extension Items {

    static let url = URL(string: "https://private-031502-iostraining1.apiary-mock.com/data_test")

    static func getItems(itemsHandler: @escaping(Items) -> Void) {
        if let url = url {

            let session = URLSession.shared
            session.dataTask(with: url, completionHandler: { data, _, _ in

                if let data = data {
                    let decoder = JSONDecoder()

                    do {
                        let items = try decoder.decode(Items.self, from: data)
                        itemsHandler(items)
                    } catch {
                        NSLog("Can't parse date: \(error)")
                    }
                }

            }).resume()
        }
    }
}