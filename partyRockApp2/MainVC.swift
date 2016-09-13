//
//  ViewController.swift
//  partyRockApp2
//
//  Created by Cody Condon on 2016-09-13.
//  Copyright © 2016 Cody Condon. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "http://www.josepvinaixa.com/blog/wp-content/uploads/2015/07/Redfoo-Where-the-Sun-Goes-2015-1200x1200-Single.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ev4bY1SkZLg\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Where The Sun Goes Down")
        
        
        let p2 = PartyRock(imageURL: "https://i.ytimg.com/vi/SjmTFIHX1yo/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/SjmTFIHX1yo\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Lights Out")
        
        let p3 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/1/1b/Redfoo_-_New_Thang_(cover).jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/X1U7ZFqOH-M\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Redfoo - New Thang (Dance Rehearsal)")
        
        let p4 = PartyRock(imageURL: "http://beatcog.com/wp-content/uploads/2015/10/redfoo-booty-man-2015.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Md-8YlE-KhA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Redfoo - Booty Man (Official 360° Music Video)")
        
        let p5 = PartyRock(imageURL: "https://i.ytimg.com/vi/gZIqW92GaTQ/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/gZIqW92GaTQ\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Party Rock Mansion COMMERCIAL!")
        
        
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)

        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }
    
    
    

   


}

