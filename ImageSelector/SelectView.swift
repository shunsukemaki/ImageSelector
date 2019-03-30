//
//  SelectView.swift
//  ImageSelector
//
//  Created by maki on 2019/03/29.
//  Copyright © 2019 aby. All rights reserved.
//

import UIKit

protocol SelectViewDelegate{
    func selectChanged(image: UIImage)
}

class SelectView : UIScrollView {
    static let kNotToucheTagId = -1
    var images: [UIImage] = [UIImage(named: "01.png")!,
                             UIImage(named: "02.png")!,
                             UIImage(named: "03.png")!,
                             UIImage(named: "04.png")!,
                             UIImage(named: "05.png")!,
                             UIImage(named: "06.png")!,
                             UIImage(named: "11.png")!,
                             UIImage(named: "12.png")!,
                             UIImage(named: "13.png")!,
                             UIImage(named: "14.png")!,
                             UIImage(named: "15.png")!,
                             UIImage(named: "16.png")!,]
    var selectViewDelegate: SelectViewDelegate? = nil
    var imageViews: [UIImageView] = []
    var imageRect:CGRect? = nil
    
    override func didMoveToSuperview() {
        imageRect = CGRect(x: 0, y: 0, width: self.bounds.height, height: self.bounds.height)
        self.contentSize = CGSize(width: self.bounds.height*CGFloat(images.count), height: self.bounds.height)
        self.isUserInteractionEnabled = true
        self.tag = SelectView.kNotToucheTagId
        setImageViews()
    }
    
    func setImageViews() {
        let x = self.bounds.height/2
        let y = self.bounds.height/2
        for i in 0..<images.count {
            imageViews.insert(UIImageView(), at: i)
            imageViews[i] = UIImageView(frame: imageRect!)
            imageViews[i].image = images[i]
            imageViews[i].layer.position = CGPoint(x: x+imageRect!.width*CGFloat(i), y:y)
            imageViews[i].isUserInteractionEnabled = true
            imageViews[i].tag = i
            self.addSubview(imageViews[i])
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if selectViewDelegate == nil {
            return
        }
        for touch: UITouch in touches {
            if touch.view!.tag == SelectView.kNotToucheTagId {
                return
            }
            self.selectViewDelegate!.selectChanged(image: images[touch.view!.tag])
            break
        }
    }
}

