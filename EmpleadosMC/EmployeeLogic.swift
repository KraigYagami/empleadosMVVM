//
//  EmployeeLogic.swift
//  EmpleadosMC
//
//  Created by KRYSTIAN DURÁN on 28/03/24.
//

import Foundation
import SwiftUI

@Observable
final class EmployeeLogic {

    let persistence: PersistenceInterator

    init(persistence: PersistenceInterator = Persistence()) {
        self.persistence = persistence
    }

    func getEmployees() throws -> [Employee] {
        return try persistence.loadEmployees()
    }
}
