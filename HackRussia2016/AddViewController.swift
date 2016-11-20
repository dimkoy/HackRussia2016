//
//  AddViewController.swift
//  HackRussia2016
//
//  Created by Dmitriy on 19/11/2016.
//  Copyright © 2016 Dmitriy. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var productField: UITextView!
    @IBOutlet weak var commentField: UITextView!
    
    @IBAction func addFoodToData(_ sender: UIButton) {
        
        //TODO кнопка отправляет запрос
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addressField.layer.borderWidth = 1
        addressField.layer.cornerRadius = 5
        productField.layer.borderWidth = 1
        productField.layer.cornerRadius = 5
        commentField.layer.borderWidth = 1
        commentField.layer.cornerRadius = 5
       // addressField.layer.borderColor = UIColor.black

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //TODO
    // Сбор информации с addressField addressField commentField формирование JSON запроса в базу данных для создания новой точки
    //TODO
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
