//
//  NewsDetailController.swift
//  Fetching and Parsing JSON
//
//  Created by MoreriDaffa on 07/11/18.
//  Copyright © 2018 MoreriProject. All rights reserved.
// mantap jiwa

import UIKit

class NewsDetailController: UIViewController {

    @IBOutlet weak var lbDetailTitle: UILabel!
    @IBOutlet weak var imgDetail: UIImageView!
    @IBOutlet weak var tvContent: UITextView!
    
    var acccomodateTitle: String?
    var accomodateCont: String?
    var accomodateImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = try? Data(contentsOf: URL(string: accomodateImage!)!)
        
        lbDetailTitle.text = acccomodateTitle
        tvContent.text = accomodateCont
        imgDetail.image = UIImage(data: data!)
       
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
