//
//  EmpleadosMCApp.swift
//  EmpleadosMC
//
//  Created by KRYSTIAN DURÁN on 27/03/24.
//

import SwiftUI

@main
struct EmpleadosMCApp: App {

    @State var vm = GestionViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(vm)
        }
    }
}
