//
//  PersistencePreview.swift
//  EmpleadosMC
//
//  Created by KRYSTIAN DURÁN on 28/03/24.
//

import Foundation

struct PersistencePreview: PersistenceInterator {
    var urlBundle: URL {
        Bundle.main.url(forResource: "EmployeesDemoTest", withExtension: "json")!
    }

    var docURL: URL {
        URL.documentsDirectory.appending(path: "EmployeesDemoTest.json")
    }
}

extension GestionViewModel {
    static let preview = GestionViewModel(employeeLogic: EmployeeLogic(persistence: PersistencePreview()))
}

extension Employee {
    static let test = Employee(
        id: "1",
        firstName: "Pepe",
        lastName: "Escarlata",
        email: "test@test.com",
        gender: .male,
        department: .Accounting,
        avatar: URL(string: "https://areajugones.sport.es/wp-content/uploads/2020/03/sasuke-min.jpg")!
    )
}
