//
//  DemoTableViewController.swift
//  TableViewDemo
//
//  Created by David McLaren on 4/28/17.
//  Copyright © 2017 David McLaren. All rights reserved.
//

import UIKit

class DemoTableViewController: UITableViewController {
    //MARK: Properties
    
    // demoCharacters as a var is mutable
    // we can add more characters after initialization
    var demoCharacters = [SampleCharacter]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSampleData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demoCharacters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // This should match our cell's identifier in our Main.storyboard
        let cellIdentifier = "DemoTableViewCell"
        
        // Because we're using a custom cell class, we need to downcast the cell to our custom cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DemoTableViewCell else {
            fatalError("Dequeued cell is not our custom DemoTableViewCell")
        }
        
        // Matches the correct data to the correct table cell
        let demoCharacter = demoCharacters[indexPath.row]
        
        cell.nameLabel.text = demoCharacter.name
        cell.descLabel.text = demoCharacter.desc
        cell.photoImageView.image = demoCharacter.img

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

    
    private func loadSampleData() {
        let mario_image = UIImage(named: "Mario")
        let dk_image = UIImage(named: "DonkeyKong")
        let fox_image = UIImage(named: "Fox")
        
        let mario_desc = "The italian plumber who saves the Mushroom Kingdom"
        let dk_desc = "The ape who loves banannas and hates crocodiles"
        let fox_desc = "The fox who flys his special arwing"
        
        guard let sample1 = SampleCharacter("Mario", mario_desc, mario_image) else {
            fatalError("Unable to initialize Sample 1: Mario")
        }
        
        guard let sample2 = SampleCharacter("Donkey Kong", dk_desc, dk_image) else {
            fatalError("Unable to initialize Sample 2: Donkey Kong")
        }
        
        guard let sample3 = SampleCharacter("Fox McCloud", fox_desc, fox_image) else {
            fatalError("Unable to initialize Sample 3: Fox McCloud")
        }
        
        demoCharacters += [sample1, sample2, sample3]
    }
}
