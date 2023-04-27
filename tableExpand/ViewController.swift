//
//  ViewController.swift
//  tableExpand
//
//  Created by Mohan K on 24/11/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableViewobj: UITableView!
    
    var arrNames = ["balaji","praveen","ayyarappan","dhillip","mohan"]
    
    var arrImages = ["image","image1","image2","image","image1"]
    
    var selectedIndex = -1
    var isCollapse = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewobj.dataSource = self
        tableViewobj.delegate = self
        
        tableViewobj.estimatedRowHeight = 300
        tableViewobj.rowHeight = UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedIndex == indexPath.row && isCollapse == true {
            return 150
        }else {
            return 40
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrNames.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandTableViewCell") as! expandTableViewCell
        cell.nameLabel.text =  arrNames[indexPath.row]
     
        cell.imgObj.image = UIImage(named: "\(arrImages[indexPath.row])")
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedIndex == indexPath.row{
            if self.isCollapse == false {
                isCollapse = true
            }
            else{
                isCollapse = false
            }
        }
        
        selectedIndex = indexPath.row
        
        tableViewobj.reloadRows(at: [indexPath], with: .automatic)
    }
   
}

