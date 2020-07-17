//
//  Secrets.swift
//  Clima
//
//  Created by Christian Eiselt on 17.07.20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct Secrets
{
    var secrets:[String:String] = ["openWeatherMap":"INSERT_API_KEY_HERE"]

    func getToken(for application: String) -> String
    {
        return secrets[application] ?? ""
    }
}
