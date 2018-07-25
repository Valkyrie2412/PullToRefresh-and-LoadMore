//
//  TableViewController.swift
//  PullToRefresh
//
//  Created by Hiếu Nguyễn on 7/23/18.
//  Copyright © 2018 Hiếu Nguyễn. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    //    private let refreshcontrol = UIRefreshControl()
    // Trong UITableViewController co san ham refreshcontrol nen khong can khoi tao instance
    var arrayNumbers: [Int] = Array(1...100).reversed()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = UIColor.purple
        refreshControl?.attributedTitle = NSAttributedString(string: "Adding Data")
        refreshControl?.addTarget(self, action: #selector(addData) , for: UIControlEvents.valueChanged)
        //        tableView.addSubview(refreshcontrol)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayNumbers.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(arrayNumbers[indexPath.row])
        return cell
    }
    
    @objc func addData(_ refreshcontrol: UIRefreshControl) {
        let firstNumber = arrayNumbers.first!
        arrayNumbers.insert(firstNumber + 1, at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
        refreshcontrol.endRefreshing()
    }
    // LOAD MORE
//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let lastElement = arrayNumbers.count - 1
//        if  lastElement == indexPath.row {
//            loadMore()
//        }
//    }
//
//    func loadMore() {
//        let lastNumber = arrayNumbers.last!
//        arrayNumbers.append(lastNumber + 1)
//        tableView.insertRows(at: [IndexPath(row: arrayNumbers.count, section: 0)], with: .fade)
//        tableView.reloadData()
//    }
    
    
}

