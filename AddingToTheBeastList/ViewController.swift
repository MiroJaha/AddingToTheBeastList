//
//  ViewController.swift
//  AddingToTheBeastList
//
//  Created by admin on 06/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var beastEntry: UITextField!
    @IBOutlet weak var tableView: UITableView!

    var tasks = ["Exercise for 30 minutes", "Wireframe for some project", "Do laundry"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }

    @IBAction func beastButtonPressed(_ sender: UIButton) {
        guard let task = beastEntry.text else {return}
        if task.isEmpty {return}
        tasks.append(task)
        tableView.reloadData()
        beastEntry.text = ""
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        cell.textLabel?.textAlignment = .left
        cell.detailTextLabel?.text = String(indexPath.row)
        cell.detailTextLabel?.textAlignment = .right
        cell.detailTextLabel?.isEnabled = true
        cell.detailTextLabel?.textColor = .black
        cell.detailTextLabel?.isHidden = false
        return cell
    }
}
