//
//  TaskStore.swift
//  TahDoodle
//
//  Created by Tyion Lashley on 12/18/22.
//

import Foundation


class TaskStore: ObservableObject

{
    private var fileUrl: URL {
        
        let fileManager = FileManager.default
        
        let documentDirectories = fileManager.urls(for: .documentDirectory,
                                                   in: .userDomainMask)
        
        let myDocumentDirectory = documentDirectories.first!
        
        let taskFileUrl = myDocumentDirectory.appendingPathComponent("tasks.json")
        
        print("Task file is \(taskFileUrl)")
        
        return taskFileUrl
        
        
        
    }
    @Published private(set) var tasks: [Task] = []
    
    init()
    
    {
        
        loadTasks()
        
    }
    func addTask(task: Task)
    
    {
        
        tasks.append(task)
        
        saveTasks()
}
    
    func removeTask(task: Task)
    
    {
        
        guard let index = tasks.firstIndex(of: task)
                
                else
                    
        {
            
            return
            
        }
        
        tasks.remove(at: index)
        
        saveTasks()
    }
    
    
    private func saveTasks()
    
    {
        
        do
            
        {
            
            let encoder = JSONEncoder()
          
            let data = try encoder.encode(tasks)
            
            try data.write(to: fileUrl)
            
            print("Saved: \(tasks.count) to \(fileUrl.path)")
            
            
            
        }
        
        catch
            
        {
            
            print("Couldn't save tasks. Reason: \(error)")
            
        }
    }
    
    private func loadTasks()
    
    {
        
        do {
            
            let data = try Data(contentsOf: fileUrl)
            
            let decoder = JSONDecoder()
            
            tasks = try decoder.decode([Task].self, from: data)
            
            print("loaded \(tasks.count) from \(fileUrl.path)")
            
        }
        
        catch
        {
            
            print("Could not load tasks. Reason: \(error)")
        }
    }
}

#if DEBUG

extension TaskStore

{
    
    static var sample: TaskStore = {
        
        let tasks = [
        
            Task(title: "Add milk to reminders"),
            Task(title: "Feed Evan"),
            
            Task(title: "Call apple")
            
        ]
        
        let store = TaskStore()
        
        store.tasks = tasks
        
        return store
        
    }()
}


#endif
