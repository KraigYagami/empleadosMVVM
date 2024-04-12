//
//  GestionViewModel.swift
//  EmpleadosMC
//
//  Created by KRYSTIAN DURÁN on 28/03/24.
//

import Foundation

@Observable
final class GestionViewModel {
    var getEmployeesUseCase: GetEmployeesUseCase

    var employees: [Employee] = []
    var showAlert = false
    var message = String()

    init(getEmployeesUseCase: GetEmployeesUseCase = GetEmployeesUseCase()) {
        self.getEmployeesUseCase = getEmployeesUseCase
        getEmployees()
    }

    func getEmployees() {
        do {
            employees = try getEmployeesUseCase.getEmployees()
        } catch {
            showAlert = true
            message = error.localizedDescription
        }
    }

    func updateEmployee(_ employee: Employee) {

        guard let index = employees.firstIndex(where: { $0.id == employee.id }) else {
            showAlert = true
            message = "Employee not found"
            return
        }

        employees[index] = employee

        print(employees)
        // Update employee in database
    }

}
