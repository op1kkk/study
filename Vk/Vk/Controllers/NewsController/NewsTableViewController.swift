//
//  NewsTableViewController.swift
//  Vk
//
//  Created by Александр Чигрин on 17.12.2021.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    struct News {
        var avtor: String
        var data: String
        var newsText: String
        var avtorImage: UIImage
        var newsImage: UIImage
    }
    
    var newsArray = [News]()

    private let cellReuseIdentifier = "NewsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)

        newsArray = [
        News(avtor: "Gogi", data: "22.10.2025", newsText: "Apple запустит специальный сервис Self Service Repair (Сервис самостоятельного ремонта) по продаже деталей и инструментов для ремонта пользователями телефонов и планшетов. Об этом говорится на сайте корпорации. На начальном этапе программа будет сосредоточена на наиболее часто ремонтируемых модулях [устройств], таких как дисплей iPhone, аккумулятор и камера», — сообщила корпорация, отметив, что возможность «дополнительного ремонта» станет доступна позднее, в 2022 году. Первыми для покупки станут доступны детали для телефонов из линеек iPhone 12 и iPhone 13, затем появятся запчасти к компьютерам Mac с чипами M1. В Apple уточнили, что Self Service Repair заработает в начале 2022 года в США и в течение года распространится на другие страны.", avtorImage: UIImage(named: "avtor")!, newsImage: UIImage(named: "news")!)]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! NewsTableViewCell

        let news = newsArray[indexPath.item]
        cell.avtorLabel.text = "\(news.avtor)"
        cell.avtorImage.image = news.avtorImage
        cell.newsImage.image = news.newsImage
        cell.newsLabel.text = "\(news.newsText)"
        cell.dataLabel.text = "\(news.data)"
        cell.newsLabel.lineBreakMode = .byWordWrapping
        cell.newsLabel.numberOfLines = 30

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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
