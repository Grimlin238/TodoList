//
//  TahDoodleApp.swift
//  TahDoodle
//
//  Created by Tyion Lashley on 12/18/22.
//

import SwiftUI

@main
struct TahDoodleApp: App {
    
    let taskStore = TaskStore()
    
    var body: some Scene {
        WindowGroup {
            //TaskListView(taskStore: .sample)
            ContentView(taskStore: taskStore)
        }
    }
}
