//
//  ViewController.swift
//  ImageSelector
//
//  Created by maki on 2019/03/29.
//  Copyright © 2019 aby. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SelectViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var selectView: SelectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "01.png")
        imageView.image = image
        selectView.selectViewDelegate = self
    }
    
    func selectChanged(image: UIImage) {
        imageView.image = image
    }
}

