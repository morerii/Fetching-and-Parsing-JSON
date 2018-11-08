//
//  ViewController.swift
//  Fetching and Parsing JSON
//
//  Created by MoreriDaffa on 06/11/18.
//  Copyright © 2018 MoreriProject. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tbViewBerita: UITableView!
    var berita: [Berita]? = []
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    func fetchBerita(){
        let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines?sources=techradar&apiKey=3a1cb82c089e427681a032cda5c39245")!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
            
            if error != nil {
                print(error as Any)
                return
            }
            
            self.berita = [Berita]()
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: AnyObject]
                
                if let articleFromJSON = json["articles"] as? [[String: AnyObject]] {
                    
                    for articleJSON in articleFromJSON{
                        let berita = Berita()
                        if let title = articleJSON["title"] as? String,
                            let description = articleJSON["description"] as? String,
                            let author = articleJSON["author"] as? String,
                            let urlToImage = articleJSON["urlToImage"] as? String,
                            let content = articleJSON["content"] as? String
                        {
                            berita.desc = description
                            berita.title = title
                            berita.author = author
                            berita.imgURL = urlToImage
                            berita.content = content
                        }
                        self.berita?.append(berita)
                        
                    }
                    DispatchQueue.main.async {
                        self.tbViewBerita.reloadData()
                    }
                }
                
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "beritaCell", for: indexPath) as! BeritaCell
        
        cell.lbTitle.text = self.berita?[indexPath.item].title
        cell.lbDesc.text = self.berita?[indexPath.item].desc
        cell.lbAuthor.text = self.berita?[indexPath.item].author
        cell.imgBerita.downloadImage(from: (self.berita?[indexPath.item].imgURL)!)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let story = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let toNewsDetail = story.instantiateViewController(withIdentifier: "newsDetail") as! NewsDetailController
        
        toNewsDetail.acccomodateTitle = self.berita?[indexPath.item].title
        toNewsDetail.accomodateCont = self.berita?[indexPath.item].content
        
        show(toNewsDetail, sender: self)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }

}

extension UIImageView {
    func downloadImage(from url: String) {
        let urlRequest = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlRequest) {(data, response, error)
    
        in
        if error != nil {
            print(error as Any)
            return
    }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
    }
        task.resume()
}
}





