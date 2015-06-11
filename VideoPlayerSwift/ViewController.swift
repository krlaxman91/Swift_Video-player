//
//  ViewController.swift
//  VideoPlayerSwift
//
//  Created by Laxman on 10/06/15.
//  Copyright (c) 2015 mac. All rights reserved.
//

import UIKit

import MediaPlayer
import MobileCoreServices



class ViewController: UIViewController ,UIImagePickerControllerDelegate ,UINavigationControllerDelegate
{
    
    var objMoviePlayerController: MPMoviePlayerController = MPMoviePlayerController()
    var urlVideo :NSURL = NSURL()
    

    @IBOutlet var chooseVideoButton: UIButton!
    
    
    @IBOutlet var vwVideoView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Select Video"
        
        chooseVideoButton.backgroundColor = UIColor.greenColor()
        chooseVideoButton.layer.cornerRadius = 5.0
        chooseVideoButton.layer.borderColor = UIColor.whiteColor().CGColor
        
        vwVideoView.layer.cornerRadius = 8.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func chooseVideButtonAction(sender: AnyObject) {
        
        var ipcVideo = UIImagePickerController()
        ipcVideo.delegate = self
        ipcVideo.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        var kUTTypeMovieAnyObject : AnyObject = kUTTypeMovie as AnyObject
        ipcVideo.mediaTypes = [kUTTypeMovieAnyObject]
        self.presentViewController(ipcVideo, animated: true, completion: nil)
        
        
        
    }

    
    
    
    func imagePickerController(picker: UIImagePickerController,didFinishPickingImage image: UIImage! ,didFinishPickingMediaWithInfo info: NSDictionary)
    {
        
         urlVideo  = info.objectForKey(UIImagePickerControllerMediaURL) as! NSURL
       
        // var urlVideo :NSURL = NSURL()
        
      //  var  urlVideo :NSURL = info[UIImagePickerControllerMediaURL] as! NSURL
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        objMoviePlayerController = MPMoviePlayerController(contentURL: urlVideo)
        objMoviePlayerController.movieSourceType = MPMovieSourceType.Unknown
        objMoviePlayerController.view.frame = self.vwVideoView.bounds
        objMoviePlayerController.scalingMode = MPMovieScalingMode.AspectFill
        objMoviePlayerController.controlStyle = MPMovieControlStyle.Embedded
        objMoviePlayerController.shouldAutoplay = true
        
        vwVideoView.addSubview(objMoviePlayerController.view)
        
        objMoviePlayerController.prepareToPlay()
        objMoviePlayerController.play()
    }
  
    
    
    
}

