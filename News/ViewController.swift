//
//  ViewController.swift
//  News
//
//  Created by  User on 07.02.2022.
//  Copyright © 2022 abr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    
    var data = [Article]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        JSONParser().getArticles{ articles in
            if let articles = articles {
                self.data = articles
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseID") as! TableViewCellController
        if let title = data[indexPath.row].title, let imgURL = data[indexPath.row].urlToImage {
            cell.titleLabel.text = title
            cell.titleLabel.numberOfLines = 0
            cell.titleLabel.lineBreakMode = .byWordWrapping
            cell.titleLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
            if let image = try? Data(contentsOf: imgURL) {
                DispatchQueue.main.async {
                    cell.imgURL.image = UIImage(data: image)
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = data[indexPath.row].url {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

