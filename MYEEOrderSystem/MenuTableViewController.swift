//
//  MenuTableViewController.swift
//  MYEEOrderSystem
//
//  Created by 洪宗燦 on 2024/9/5.
//

import UIKit

class MenuTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    var menu: Menu?
    var menuType: String?
    var items: [Any] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        downloadMenu()
        
        // Do any additional setup after loading the view.
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
                   print("Failed to decode JSON: \(error.localizedDescription)")
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
            self.tableview.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
