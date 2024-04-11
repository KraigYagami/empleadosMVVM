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
    static let shared = EmployeeLogic()

    let persistence: PersistenceInterator

    var employees: [Employee]

    var showAlert = false
    var message = String()

    init(persistence: PersistenceInterator = Persistence()) {
        self.persistence = persistence

        do {
            employees = try persistence.loadEmployees()
        } catch {
            employees = []
            message = error.localizedDescription
            showAlert.toggle()
        }
    }
}
