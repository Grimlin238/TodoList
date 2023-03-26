//
//  TaskView.swift
//  TahDoodle
//
//  Created by Tyion Lashley on 12/18/22.
//

import SwiftUI


struct TaskView: View
{
    
    let title: String
    
    var body: some View
    
    {
        
        Text(title)
                
            .padding(.vertical, 50)
        
            .background(Color.blue)
        
            .font(.title3)
    }
}


struct TaskCell_Preview: PreviewProvider

{
    
    static var previews: some View
    
    {
        
        TaskView(title: "Take the dog for a walk")
    }
}
