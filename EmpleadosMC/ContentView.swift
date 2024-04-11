//
//  ContentView.swift
//  EmpleadosMC
//
//  Created by KRYSTIAN DURÁN on 27/03/24.
//

import SwiftUI

struct ContentView: View {

    @Environment(GestionViewModel.self) var vm
//    @State var vm = GestionViewModel()

    var body: some View {
        @Bindable var employeeLogicBinding = vm.employeeLogic

        NavigationStack {
            List(vm.employeeLogic.employees) { employee in
                NavigationLink(value: employee) {
                    EmployeeCell(employee: employee)
                }
            }
            .navigationTitle("Employees")
            .navigationDestination(for: Employee.self, destination: { employee in
                DetailEmployee(employee: employee)
            })
            .alert(
                "Application Error",
                isPresented: $employeeLogicBinding.showAlert
            ) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(vm.employeeLogic.message)
            }
        }
    }
}

#Preview {
//    ContentView(vm: GestionViewModel.preview)
    ContentView()
        .environment(GestionViewModel.preview)
}
