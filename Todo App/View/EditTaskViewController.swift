//
//  EditTaskViewController.swift
//  Todo App
//
//  Created by Huy Nguyễn on 06/04/2022.
//

import UIKit

class EditTaskViewController: UIViewController {
    
    var task: Task?
    
    let vm = TodoViewModel.sharedInstance
    
    var index: Int?
    
    @IBOutlet weak var txtTaskName: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func saveButton(_ sender: Any){
        print("Saving ...")
        let newTask = Task(name: txtTaskName.text ?? "", time: datePicker.date)
        
        vm.editTask(task: self.task!, updateTask: newTask){
            print("Task updated successfully")
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        print("Deleting ...")

        vm.deleteTask(task: self.task!, taskIndex: self.index!){
            print("Task deleted successfully")
            navigationController?.popViewController(animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
          let borderColor : UIColor = .systemBlue
          txtTaskName.layer.borderWidth = 0.5
          txtTaskName.layer.borderColor = borderColor.cgColor
          txtTaskName.layer.cornerRadius = 5.0
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let myTask = self.task {
            txtTaskName.text = myTask.name
            datePicker.date = myTask.time
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
