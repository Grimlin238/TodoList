//
//  ContentView.swift
//  TahDoodle
//
//  Created by Tyion Lashley on 12/18/22.
//

import SwiftUI

struct ContentView: View {
    
    let taskStore: TaskStore
    
    @State private var newTaskTitle = ""
    
    private var newTaskView: some View
    
    {
        
        HStack
        {
            
            TextField("Something to do", text: $newTaskTitle)
            
            Button("add task") {
                
                let task = Task(title: newTaskTitle)
                
                taskStore.addTask(task: task)
                newTaskTitle = ""
            }
            
            .disabled(newTaskTitle.isEmpty)
        }
        
        .padding()
        
    }
    
    var body: some View {
        VStack
        {
            
            newTaskView
            
            TaskListView(taskStore: taskStore)
        }
        
    }
    
}

struct ContentView_Preview: PreviewProvider

{
    
    
    static var previews: some View
    {
        
        ContentView(taskStore: .sample)
    }
}
