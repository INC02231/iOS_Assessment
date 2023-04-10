//
//  DataModel.swift
//  FetchAPI
//
//  Created by Incture on 10/04/23.
//

import Foundation
struct JsonDataModelElement: Codable {
    var userID, id: Int?
    var title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
