//
//  HomeViewController.swift
//  TimeKorean
//
//  Created by ๆฅ็ฐๅฎๅฉ on 2022/09/13.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    let realm = try! Realm()
    
    @IBOutlet var gameButton: UIButton!
    @IBOutlet var wordButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gameButton.layer.cornerRadius = 30
        self.wordButton.layer.cornerRadius = 30
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapGameButton() {
        let userData = realm.objects(Word.self)
        
        if userData.count == 0 {
            print("๐บ๐ธ")
            let alert: UIAlertController = UIAlertController(title: "ๅ่ชใฎ็ป้ฒใใใใพใใ", message: "ๅ่ชใ็ป้ฒใใฆใใ ใใ", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "ๅ่ช็ป้ฒ", style: .default, handler: { action in
                self.performSegue(withIdentifier: "WordView", sender: nil)
            }))
            
            present(alert, animated: true, completion: nil)
        } else if userData.count < 10 {
            let alert: UIAlertController = UIAlertController(title: "ๅ่ชใฎ็ป้ฒใๅฐใชใใงใ", message: "ๅ่ช็ป้ฒใๅคใๆนใ้ซใๅญฆ็ฟๆๆใๅพใใใพใ", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "ใฒใผใ ใ็ถใใ", style: .default, handler: { action in
                self.performSegue(withIdentifier: "toGame", sender: nil)
            }))
            
            alert.addAction(UIAlertAction(title: "ๅ่ช็ป้ฒ", style: .default, handler: { action in
                self.performSegue(withIdentifier: "WordView", sender: nil)
            }))
            
            present(alert, animated: true, completion: nil)
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

}
