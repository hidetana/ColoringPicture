//
//  ColoringViewController.swift
//  ColoringOnPicture
//
//  Created by Hidekazu TANAKA on 2016/07/04.
//  Copyright © 2016年 Excelsum Lab. All rights reserved.
//

import UIKit

class ColoringViewController: UIViewController {
    
    var selectedImage: UIImage?
    @IBOutlet weak var editingImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        editingImageView.image = selectedImage
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Image processing
    //func prosessingImage(image: UIImage) -> UIImage {
        
        
    //}
}
