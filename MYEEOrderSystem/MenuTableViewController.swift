//
//  MenuTableViewController.swift
//  MYEEOrderSystem
//
//  Created by 洪宗燦 on 2024/9/5.
//

import UIKit

class MenuTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var menu: Menu?
    var menuType: String?
    var items: [Any] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func loadMenuItems() {
        if menuType == "noodles", let noodles = menu?.restaurant.menu.noodles{
            items = noodles
        } else if menuType == "sideDishes", let sideDishes = menu?.restaurant.menu.sideDishes {
            items = sideDishes
        }
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
