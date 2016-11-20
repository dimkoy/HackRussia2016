//
//  MealTableViewController.swift
//  HackRussia2016
//
//  Created by Dmitriy on 20/11/2016.
//  Copyright © 2016 Dmitriy. All rights reserved.
//

import UIKit
import MapKit
//import SwiftyJSON



class MealTableViewController: UITableViewController {
    
    var meals = [AddressData]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleMeals()
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    
    
    
    func loadSampleMeals() {
        
        //TODO загрузка информации о точках с сервера
        
        let coordinate1 = CLLocationCoordinate2D(latitude: 30.38041267773434, longitude: 60.0422943831192)
        let meal1 = AddressData(coordinate: coordinate1, food: "Картошечка", comment: "Заморожена")!
        let coordinate2 = CLLocationCoordinate2D(latitude: 30.38041367773434, longitude: 60.0422943831192)
        let meal2 = AddressData(coordinate: coordinate2, food: "Пюрешечка", comment: "С комочками")!
        let coordinate3 = CLLocationCoordinate2D(latitude: 30.38041267773434, longitude: 60.0422953831192)
        let meal3 = AddressData(coordinate: coordinate3, food: "Катлетки", comment: "Срок годности истекает завтра")!
        
        meals += [meal1, meal2, meal3]
        
        
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  meals.count

    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MealTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MealTableViewCell
        
        let meal = meals[indexPath.row]

        // Configure the cell...
        cell.coordinateLabel.text = String(meal.coordinate.latitude) + String(meal.coordinate.longitude)
        cell.foodView.text = meal.food
        cell.commentView.text = meal.comment

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
