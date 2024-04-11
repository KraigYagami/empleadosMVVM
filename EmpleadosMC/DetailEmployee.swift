//
//  DetailEmployee.swift
//  EmpleadosMC
//
//  Created by KRYSTIAN DURÁN on 28/03/24.
//

import SwiftUI

struct DetailEmployee: View {

    let employee: Employee

    var body: some View {
        Form {
            LabeledContent("First Name: ", value: employee.firstName)
            LabeledContent("Last Name: ", value: employee.lastName)
            LabeledContent("Email: ", value: employee.email)
        }
        .navigationTitle("Employee Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailEmployee(employee: .test)
        .environment(GestionViewModel.preview)
}
