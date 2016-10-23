//
//  ViewController.swift
//  Project1DG
//
//  Created by Dean Guo on 10/22/16.
//  Copyright © 2016 fourestfire. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    override func viewDidLoad() {
        // Runs the system viewDidLoad function first
        super.viewDidLoad()
        
        title = "Storm Viewer"
        
        // Works with the filesystem to find our images
        let fm = FileManager.default
        
        // Bundle is directory containing compiled program and all assets. Path points there.
        let path = Bundle.main.resourcePath!
        
        // Set items to the contents of the main directory.
        // Because this method can throw an error, we have to use try! in front of it to let them know that we know it will not throw an error. Test this?
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        // For all items in the directory, add those that have a prefix starting in "nssl".
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
                print(pictures)
            }
        }
    }
    
    // We take the total number of pictures and make that how many rows we have
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // We dequeue cells (those waiting to be processed) to use them in our table.
    // Label the cell with a title: what the picture text is.
    // It was very important to name the Cell view "Picture" in the storyboard - otherwise it wouldn't be able to run.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller from the storyboard and typecasting it to be DetailViewController
        // storyboard? will let it do nothing if it doesn't work
        // as? typecasting changes the default instantiateViewController to be DetailViewController instead of UIViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
          
            // 2: Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            
            // 3: Now push it onto the navigation controller, making the screen show itsef
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


