//
//  OrderViewController.swift
//  MYEEOrderSystem
//
//  Created by 洪宗燦 on 2024/9/5.
//

import UIKit

class OrderViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
//    func displayMenu(menu: Menu) {
//          // 顯示餐廳名稱
//          self.title = menu.restaurant.name
          
          // 你可以將餐廳資料顯示在 UI 元素上，例如 UILabel, UITableView 等
          // 使用例如: menu.restaurant.menu.noodles, menu.restaurant.menu.sideDishes
          // 來存取菜單資料並顯示在對應的 UI 上
//      }
    
         
    
        
    }
    
    @IBAction func showNoodles(_ sender: UIButton) {
        navigateToMenu(type: "noodles")
    }
    
    @IBAction func showSideDishes(_ sender: UIButton) {
        navigateToMenu(type: "sideDishes")
    }
    func navigateToMenu(type: String){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let menuVC = storyboard.instantiateViewController(identifier: "MenuTableViewController") as? MenuTableViewController{
           
            menuVC.menuType = type
        
           
            
            
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


