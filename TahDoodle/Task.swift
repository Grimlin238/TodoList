//
//  Task.swift
//  TahDoodle
//
//  Created by Tyion Lashley on 12/18/22.
//

import Foundation

struct Task: Equatable, Identifiable, Codable

{
    
    let id: UUID
    let title: String
    
    init(title: String)
    
    {
        
        id = UUID()
        
        self.title = title
    }
}
