//
//  DetailEmployee.swift
//  EmpleadosMC
//
//  Created by KRYSTIAN DURÁN on 28/03/24.
//

import SwiftUI

struct DetailEmployee: View {

    @Environment(GestionViewModel.self) var viewModel

    var employeeId: String
    @State private var showModal = false
    @State private var editingField: String?
    @State private var employee: Employee?

    var body: some View {
        @Bindable var viewModelBindable = viewModel

        if let employee = $viewModelBindable.employees.first(where: { $0.id == employeeId }) {
            Form {
                LabeledContent(
                    label: "First Name",
                    value: employee.firstName
                ) {
                    editingField = "firstName"
                    showModal = true
                }
    //            LabeledContent(
    //                label: "Last Name",
    //                value: $employee?.lastName ?? ""
    //            ) {
    //                editingField = "lastName"
    //                showModal = true
    //            }
    //            LabeledContent(
    //                label: "Email",
    //                value: $employee?.email ?? ""
    //            ) {
    //                editingField = "email"
    //                showModal = true
    //            }
            }
            .sheet(isPresented: $showModal) {
                EditEmployeeModal(employee: employee, field: $editingField)
                    .environment(viewModel)
            }
            .navigationTitle("Employee Detail")
            .navigationBarTitleDisplayMode(.inline)
        } else {
            Text("Employee not found")
        }

    }
}

struct LabeledContent: View {
    var label: String
    @Binding var value: String
    var editAction: () -> Void

    var body: some View {
        HStack {
            Text("\(label):")
            Spacer()
            Text(value)
        }
        .onTapGesture {
            editAction()
        }
    }
}

struct EditEmployeeModal: View {
    @Environment(GestionViewModel.self) var viewModel
    @State private var newValue: String = ""
    @Binding var employee: Employee
    @Binding var field: String?

    var body: some View {
        VStack {
            TextField("New value", text: $newValue)
                .padding()

            Button("Save") {
                switch field {
                case "firstName":
                    employee.firstName = newValue
                case "lastName":
                    employee.lastName = newValue
                case "email":
                    employee.email = newValue
                default:
                    break
                }
                print("\(employee) - \(field ?? "nada")")
                viewModel.updateEmployee(employee)
            }
            .padding()
        }
    }
}

#Preview {
    DetailEmployee(employeeId: "1")
        .environment(GestionViewModel.preview)
}
