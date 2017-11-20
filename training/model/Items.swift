//
// Created by Benedykt Ziobro on 15/11/2017.
// Copyright (c) 2017 Benedykt Ziobro. All rights reserved.
//

import Foundation


struct Items {
    var items: [String]
}

extension Items {

    static let url = URL(string: "http://private-031502-iostraining1.apiary-mock.com/data")

    static func getJson(jsonHandler: @escaping([String]) -> Void) {
        if let url = url {

            let session = URLSession.shared
            session.dataTask(with: url, completionHandler: { data, _, _ in

                if let data = data {
                    let json = try? JSONSerialization.jsonObject(with: data) as! [String]
                    jsonHandler(json!)
                }


            }).resume()
        }
    }

    init(json: [String]) {
        items = json
    }
}