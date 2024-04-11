//
//  Employee.swift
//  EmpleadosMC
//
//  Created by KRYSTIAN DURÁN on 27/03/24.
//

import Foundation

//{
//  "id": "1",
//  "first_name": "John",
//  "last_name": "Doe",
//  "email": "johndoe@example.com",
//  "gender": "Male",
//  "department": "Sales",
//  "avatar": "https://example.com/avatar1.jpg"
//}

struct Employee: Codable, Identifiable, Hashable {
    var id: String
    var firstName: String
    var lastName: String
    var email: String
    var gender: Gender
    var department: Department
    var avatar: URL

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case gender
        case department
        case avatar
    }
}
