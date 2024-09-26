//
//  MenuTableViewController.swift
//  MYEEOrderSystem
//
//  Created by 洪宗燦 on 2024/9/5.
//

import UIKit

class MenuTableViewController: UITableViewController
{
 
    var menu: Menu?
    var menuType: String?
    var items: [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadMenu()
    }
 
    func downloadMenu() {
        let urlString =
        "https://raw.githubusercontent.com/kevinaugust145/MYEEMenu/main/MYEEMenu.txt" // 替換成你實際的連結
           guard let url = URL(string: urlString) else { return }

           let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
               guard let data = data, error == nil else {
                   print("Failed to fetch data")
                   return }
               do {
                   let content = String(data: data, encoding: .utf8)
                   print(content ?? "")
                   
                   
                   let decoder = JSONDecoder()
   
                   self.menu = try decoder.decode(Menu.self, from: data)
 
                   DispatchQueue.main.async {
                       self.loadMenuItems()
                   }
            
               } catch {
                   print("Failed to decode JSON: \(error)")
               }
           }
           task.resume()
       }

    func loadMenuItems() {
        guard let menu = menu else {
            print("Menu is nil")
            return }
        
        if menuType == "noodles" {
            print(menu.restaurant.menu.noodles)
            items = menu.restaurant.menu.noodles
        }
         else if menuType == "sideDishes"{
            items = menu.restaurant.menu.sideDishes
        }
        print("Loaded items: \(items.count)")
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
     }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(items.count)")
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
        
        if menuType == "noodles" {
            let noodle = items[indexPath.row] as! Noodle
            cell.textLabel?.text = noodle.name
            cell.detailTextLabel?.text = "價格： 小 \(noodle.price.small) 大 \(noodle.price.large)"
            
        } else if menuType == "sideDishes" {
            let sideDish = items[indexPath.row] as! SideDish
            cell.textLabel?.text = sideDish.name
            cell.detailTextLabel?.text = "價格 \(sideDish.price)"
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
