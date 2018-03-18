//
//  ViewController.swift
//  Assigment-3(Drawing)
//
//  Created by MacPro on 10.02.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
class ViewController: UIViewController{
    var point = Point(UIColor.black,false,CGFloat(3))
    @IBOutlet weak var DrawingArea: DrawingArea!
    @IBAction func Undo(_ sender: AnyObject) {
        DrawingArea.layer.sublayers = nil
        DrawingArea.controllers.removeAll()
        DrawingArea.setNeedsDisplay()
    }
    @IBAction func Saving(_ sender: AnyObject) {
        if let image = imageWithView(inView: DrawingArea){
            UIImageWriteToSavedPhotosAlbum(image,nil ,nil , nil)
        }
    }
    func imageWithView(inView: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(inView.bounds.size, inView.isOpaque, 0.0)
        defer { UIGraphicsEndImageContext() }
        if let context = UIGraphicsGetCurrentContext() {
            inView.layer.render(in: context)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            return image
        }
        return nil
    }
    @IBAction func reset(_ sender: UIButton) {
        if DrawingArea.controllers.count > 0{
            DrawingArea.controllers.removeLast()
            DrawingArea.setNeedsDisplay()
        }
    }
    @IBAction func figures(_ sender: UIButton) {
        if sender.tag == 3{
            DrawingArea.swipped = true
        }
        else if sender.tag >= 0 && sender.tag != 3{
            DrawingArea.indexTool = sender.tag
            DrawingArea.swipped = false
        }
    }
    @IBAction func Fill(_ sender: UISwitch) {
        point.IsFilled = sender.isOn
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        DrawingArea.viewCC = self
        DrawingArea.swipped = false
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Settings"{
            let destination = segue.destination as! ColorSettings
            destination.controller = self
        }
    }
}
