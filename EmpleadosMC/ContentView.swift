//
//  ContentView.swift
//  EmpleadosMC
//
//  Created by KRYSTIAN DURÁN on 27/03/24.
//

import SwiftUI

struct ContentView: View {

//    @Environment(GestionViewModel.self) var viewModel
    @State var viewModel = GestionViewModel()

    var body: some View {

        NavigationStack {
            List(viewModel.employees) { employee in
                NavigationLink(value: employee.id) {
                    EmployeeCell(employee: employee)
                }
            }
            .navigationTitle("Employees")
            .navigationDestination(for: String.self, destination: { employeeId in
                DetailEmployee(employeeId: employeeId)
                    .environment(viewModel)
            })
            .alert(
                "Application Error",
                isPresented: $viewModel.showAlert
            ) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(viewModel.message)
            }
        }
    }
}

#Preview {
    ContentView(viewModel: GestionViewModel.preview)
}
