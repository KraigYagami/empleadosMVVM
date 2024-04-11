//
//  EmployeeCell.swift
//  EmpleadosMC
//
//  Created by KRYSTIAN DURÁN on 28/03/24.
//

import SwiftUI

struct EmployeeCell: View {
    let employee: Employee
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(employee.firstName), \(employee.lastName)")
                .font(.headline)
            Text(employee.email)
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(employee.department.rawValue)
                .font(.footnote)
                .padding(.top, 5)
        }
    }
}

#Preview {
    EmployeeCell(employee: .test)
}
