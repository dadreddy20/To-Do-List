//
//  SecondViewController.swift
//  To Do List
//
//  Created by Anudeep Reddy Dwaram on 02/06/15.
//  Copyright (c) 2015 iDev. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
	
	@IBOutlet weak var item: UITextField!
	
	@IBAction func addItem(sender: AnyObject) {
		toDoList.append(item.text)
		item.text = ""
		NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.item.delegate = self
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
		self.view.endEditing(true)
	}
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		item.resignFirstResponder()
		return true
	}


}

