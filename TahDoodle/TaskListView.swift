//
//  TaskListView.swift
//  TahDoodle
//
//  Created by Tyion Lashley on 12/18/22.
//

import SwiftUI

struct TaskListView: View
{
    @ObservedObject var taskStore: TaskStore
    
    var body: some View
    
    {
        
        Text("TahDoodle")
        
        List
        {
    
    
            ForEach(taskStore.tasks) {
                
                task in
                
                TaskView(title: task.title)
            }.onDelete {
                
                indexSet in
                
                indexSet.forEach {
                    
                    index in
                    
                    let task = taskStore.tasks[index]
                    
                    taskStore.removeTask(task: task)
                    
                }
            }
            }
        }
    }
    
    
    
    struct TaskListView_Preview: PreviewProvider
    
    {
        
        static var previews: some View
        {
            
            TaskListView(taskStore: .sample)
            
        }
    }

