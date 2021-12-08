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

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! CustomTableViewCell
        cell.nameLabel.text = tasks[indexPath.row]
        cell.ageLabel.text = "\(Int.random(in: 5...95)) Years Old"
//        cell.textLabel?.text = tasks[indexPath.row]
//        cell.textLabel?.textAlignment = .left
//        cell.detailTextLabel?.text = String(indexPath.row)
//        cell.detailTextLabel?.textAlignment = .right
//        cell.detailTextLabel?.isEnabled = true
//        cell.detailTextLabel?.textColor = .black
//        cell.detailTextLabel?.isHidden = false
//        cell.detailTextLabel?.sizeToFit()
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tasks.remove(at: indexPath.row)
//        tableView.reloadData()
//    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let swipe = UISwipeActionsConfiguration()
        swipe.performsFirstActionWithFullSwipe = true
        tasks.remove(at: indexPath.row)
        tableView.reloadData()
        return swipe
    }
}
