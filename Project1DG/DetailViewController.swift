//
//  DetailViewController.swift
//  Project1DG
//
//  Created by Dean Guo on 10/22/16.
//  Copyright © 2016 fourestfire. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // We dragged an outlet from the storyboard to connect to it.
    // @IBOUtlet: There's a connection between this code and the Interface Builder.
    // weak: We don't want to own the object in memory. The view owns it.
    // imageView: UIImageView!: We named our outlet imageView, and we are making it an UIImageView type.
    @IBOutlet weak var imageView: UIImageView!
    
    // Set as ? because when the view controller first gets created, it deosn't exist. This is the name of the image to load.
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets the title on the nav bar to be the name of the image
        title = selectedImage
        
        if let imageToLoad = selectedImage {
            imageView.image  = UIImage(named: imageToLoad)
        }
    }
    
    // This section allows the detail view to go into fullscreen upon tap of screen.
    // The animated parameter (is it animated or not) doesn't really matter to us
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
