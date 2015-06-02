//
//  FirstViewController.swift
//  To Do List
//
//  Created by Anudeep Reddy Dwaram on 02/06/15.
//  Copyright (c) 2015 iDev. All rights reserved.
//

import UIKit

var toDoList = [String]() // Declare empty array

class FirstViewController: UIViewController, UITableViewDelegate {

	@IBOutlet weak var table: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		// Check if initially the array is empty or not
		if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
			toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
		}
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return toDoList.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
		cell.textLabel?.text = toDoList[indexPath.row]
		return cell
	}
	
	func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		if editingStyle == UITableViewCellEditingStyle.Delete {
			toDoList.removeAtIndex(indexPath.row)
		}
		// the below method updates the deleted row
		NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
		table.reloadData()
	}

	// This method is called not just one time like the viewDidLoad() but every time when the first view controller appears
	override func viewDidAppear(animated: Bool) {
		table.reloadData()
	}

}

