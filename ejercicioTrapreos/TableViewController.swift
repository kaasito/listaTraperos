//
//  TableViewController.swift
//  ejercicioTrapreos
//
//  Created by Lucas Romero Magaña on 19/1/22.
//

import UIKit
import Alamofire
import AlamofireImage

class TableViewController: UITableViewController {

    @IBOutlet var tabla: UITableView!
    var jsonArray: NSArray?
    var nameArray: Array<String> = []
    var genreArray: Array<String> = []
    var imageURLArray: Array<String> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabla.delegate = self
        self.tabla.dataSource = self
       
        downloadDataFromAPI()
    }

    func downloadDataFromAPI(){
        AF.request("https://private-ff2081-trapi1.apiary-mock.com/trappers") .responseJSON { response in
              //2.
              if let JSON = response.value{
                 //3.
                 self.jsonArray = JSON as? NSArray
                 //4.
                 for item in self.jsonArray! as! [NSDictionary]{
                    //5.
                    let name = item["name"] as? String
                    let imageURL = item["pic"] as? String
                    let genre = item["genre"] as? String
                    self.nameArray.append((name)!)
                    self.imageURLArray.append((imageURL)!)
                    self.genreArray.append((genre)!)
                 }
                 //6.
                 self.tabla.reloadData()
         
              }
           }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nameArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CeldaTableViewCell
         
           cell.name.text = self.nameArray[indexPath.row]
         
           let url = URL(string: self.imageURLArray[indexPath.row])
           cell.pic.af_setImage(withURL: url!)
        
        cell.genre.text = self.genreArray[indexPath.row]
         
           return cell
    }
    
    

   

}
