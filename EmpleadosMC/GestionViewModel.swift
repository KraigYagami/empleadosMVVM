//
//  GestionViewModel.swift
//  EmpleadosMC
//
//  Created by KRYSTIAN DURÁN on 28/03/24.
//

import Foundation

@Observable
final class GestionViewModel {
    var employeeLogic: EmployeeLogic

    init(employeeLogic: EmployeeLogic = .shared) {
        self.employeeLogic = employeeLogic
    }

}
