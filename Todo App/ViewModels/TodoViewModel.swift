//
//  TodoViewModel.swift
//  Todo App
//
//  Created by Huy Nguyễn on 06/04/2022.
//

import Foundation
import RealmSwift

class TodoViewModel: NSObject {
    static var sharedInstance = TodoViewModel()

    
    var tasks = [Task]()
    
    typealias completionHandler  = () -> Void
    
    let realm = try! Realm()
    
    func addTask(task: Task, completion: completionHandler){
        self.realm.beginWrite()
        
        self.realm.add(task)
        
        try! self.realm.commitWrite()
        
        print("Task saved")
        
        completion()
    }
    
    func loadTask(completion: completionHandler){
        self.realm.beginWrite()
        
        let saveTasks = self.realm.objects(Task.self)
        self.tasks.removeAll()
        self.tasks.append(contentsOf: saveTasks)
        
        try! self.realm.commitWrite()
        
        completion()
    }
    
    func editTask(task: Task, updateTask : Task, completion: completionHandler){
        self.realm.beginWrite()
        self.realm.delete(task)
        self.realm.add(updateTask)
        try! self.realm.commitWrite()
        
        completion()
    }
    
    
    func deleteTask(task:Task, taskIndex: Int, completion: completionHandler){
        self.realm.beginWrite()
        self.realm.delete(task)
        try! self.realm.commitWrite()
        
        tasks.remove(at: taskIndex)
        
        completion()
    }
}
