//
//  PersistenceIterator.swift
//  EmpleadosMC
//
//  Created by KRYSTIAN DURÁN on 27/03/24.
//

import Foundation

protocol PersistenceInterator {
    var urlBundle: URL { get }
    var docURL: URL { get }

    func loadEmployees() throws -> [Employee]
    func saveEmployees(_ employees: [Employee]) throws
}

extension PersistenceInterator {
    func loadEmployees() throws -> [Employee] {
        var url = docURL
        if !FileManager.default.fileExists(atPath: url.path) {
            url = urlBundle
        }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Employee].self, from: data)
    }

    func saveEmployees(_ employees: [Employee]) throws {
        let data = try JSONEncoder().encode(employees)
        try data.write(to: docURL, options: .atomic)
    }
}

struct Persistence: PersistenceInterator {
    var urlBundle: URL {
        Bundle.main.url(forResource: "EmployeesDemo", withExtension: "json")!
    }

    var docURL: URL {
        URL.documentsDirectory.appending(path: "EmployeesDemo.json")
    }
}
