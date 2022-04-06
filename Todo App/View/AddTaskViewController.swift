//
//  AddTaskViewController.swift
//  Todo App
//
//  Created by Huy Nguyễn on 06/04/2022.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var txtTaskName: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func saveButton(_ sender: Any){
        print("Saving task ....")
        let task = Task(name: txtTaskName.text ?? "", time: datePicker.date)
        
        let vm = TodoViewModel.sharedInstance
        vm.addTask(task: task){
            self.navigationController?.popViewController(animated: true)
        }
    }

    override func viewDidLoad() {
      super.viewDidLoad()
        let borderColor : UIColor = .systemBlue
        txtTaskName.layer.borderWidth = 0.5
        txtTaskName.layer.borderColor = borderColor.cgColor
        txtTaskName.layer.cornerRadius = 5.0
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
