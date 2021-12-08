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
    func numberOfSections(in tableView: UITableView) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! CustomTableViewCell
        cell.layer.cornerRadius = 20
//        cell.MYvIEW.clipsToBounds = true
        cell.nameLabel.text = tasks[indexPath.section]
        cell.ageLabel.text = "\(Int.random(in: 5...95)) Years Old"
        
        
        if indexPath.row == 1{
            cell.backgroundColor = .blue
        }
        if indexPath.row == 2{
            cell.backgroundColor = .red
        }
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
            tasks.remove(at: indexPath.section)
            tableView.reloadData()
//        }
//        if editingStyle == .insert {
//            tasks.remove(at: indexPath.row)
//            tableView.reloadData()
//        }
//        else {
//
//        }
    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tasks.remove(at: indexPath.row)
//        tableView.reloadData()
//    }
//
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let swipe = UISwipeActionsConfiguration()
//        swipe.performsFirstActionWithFullSwipe = true
//        tasks.remove(at: indexPath.row)
//        tableView.reloadData()
//        return swipe
//    }
}
