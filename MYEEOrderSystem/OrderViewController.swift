//
//  OrderViewController.swift
//  MYEEOrderSystem
//
//  Created by 洪宗燦 on 2024/9/5.
//

import UIKit

class OrderViewController: UIViewController {
    var menu: Menu?
    override func viewDidLoad() {
        super.viewDidLoad()
       
  
    func displayMenu(menu: Menu) {
          // 顯示餐廳名稱
          self.title = menu.restaurant.name
          
          // 你可以將餐廳資料顯示在 UI 元素上，例如 UILabel, UITableView 等
          // 使用例如: menu.restaurant.menu.noodles, menu.restaurant.menu.sideDishes
          // 來存取菜單資料並顯示在對應的 UI 上
      }
    
    func downloadMenu() {
        let urlString =
        "https://raw.githubusercontent.com/kevinaugust145/MYEEMenu/main/MYEEMenu.txt" // 替換成你實際的連結
           guard let url = URL(string: urlString) else { return }

           let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
               guard let data = data, error == nil else { return }
               do {
                   let content = String(data: data, encoding: .utf8)
                   print(content ?? "")
                   
                   
                   let decoder = JSONDecoder()
   
                   let menu = try decoder.decode(Menu.self, from: data)
            
               } catch {
                   print("Failed to decode JSON: \(error.localizedDescription)")
               }
           }
           task.resume()
       }
        
    
        
    }
    
    @IBAction func showNoodles(_ sender: UIButton) {
        navigateToMenu(type: "noodles")
    }
    
    func navigateToMenu(type: String){
        let storyboard = UIStoryboard(name: "OrderViewController", bundle: nil)
        if let menuVC = storyboard.instantiateViewController(identifier: "MenuTableViewController") as?MenuTableViewController{
            menuVC.menu = menu
            
            
        }
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


