//
//  DetailEmployee.swift
//  EmpleadosMC
//
//  Created by KRYSTIAN DURÁN on 28/03/24.
//

import SwiftUI

struct DetailEmployee: View {

    var employeeId: String

    @Environment(GestionViewModel.self) var viewModel

    @State private var showModal = false
    @State private var editingField: String = ""
    @State private var currentField: String = ""

    var body: some View {

        if var employee = viewModel.employees.first(where: { $0.id == employeeId }) {
            Form {
                LabeledContent(
                    label: "First Name",
                    value: employee.firstName
                )
                .onTapGesture {
                    handleTap(for: "firstName", currentValue: employee.firstName)
                }
                LabeledContent(
                    label: "Last Name",
                    value: employee.lastName
                )
                .onTapGesture {
                    handleTap(for: "firstName", currentValue: employee.lastName)
                }
                LabeledContent(
                    label: "Email",
                    value: employee.email
                )
                .onTapGesture {
                    handleTap(for: "firstName", currentValue: employee.email)
                }
            }
            .sheet(isPresented: $showModal) {
                EditEmployeeModal(
                    newValue: $currentField,
                    onChangeValue: { newValue in
                        updateEmployeeField(employee: &employee, field: editingField, newValue: newValue)
                        viewModel.updateEmployee(employee)
                        showModal = false
                    }
                )
            }
            .navigationTitle("Employee Detail")
            .navigationBarTitleDisplayMode(.inline)
        } else {
            Text("Employee not found")
        }
    }

    func handleTap(for field: String, currentValue: String) {
        editingField = field
        currentField = currentValue
        showModal = true
    }

    func updateEmployeeField(employee: inout Employee, field: String, newValue: String) {
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
    }
}

struct LabeledContent: View {
    var label: String
    var value: String

    var body: some View {
        HStack {
            Text("\(label):")
            Spacer()
            Text(value)
        }
    }
}

struct EditEmployeeModal: View {
    @Binding var newValue: String
    var onChangeValue: (String) -> Void

    var body: some View {
        VStack {
            TextField("New value", text: $newValue)
                .padding()

            Button("Save") {
                onChangeValue(newValue)
            }
        }
    }
}

#Preview {
    DetailEmployee(employeeId: "1")
        .environment(GestionViewModel.preview)
}
