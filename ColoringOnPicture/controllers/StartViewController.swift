//
//  StartViewController.swift
//  ColoringOnPicture
//
//  Created by Hidekazu TANAKA on 2016/07/02.
//  Copyright © 2016年 Excelsum Lab. All rights reserved.
//

import UIKit

class StartViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - UI Actions
    @IBAction func touchUpStart(sender: AnyObject) {
    
        let alert: UIAlertController = UIAlertController(title: "Select Image", message: "Choose take a photo or select", preferredStyle:  UIAlertControllerStyle.ActionSheet)
        
        let takephotoAction: UIAlertAction = UIAlertAction(title: "Take a photo", style: UIAlertActionStyle.Default, handler:{
            
            (action: UIAlertAction!) -> Void in
            print("Take photo")
            self.takePhotoAction()
            
        })
        
        let selectphotoAction: UIAlertAction = UIAlertAction(title: "Library", style: UIAlertActionStyle.Default, handler:{
            
            (action: UIAlertAction!) -> Void in
            print("Library")
            self.selectPhotoAction()
            
        })
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler:{
            
            (action: UIAlertAction!) -> Void in
            print("Cancel")
        })
        
        
        alert.addAction(takephotoAction)
        alert.addAction(selectphotoAction)
        alert.addAction(cancelAction)
        
        
        presentViewController(alert, animated: true, completion: nil)

        
    }

    // MARK: - Action methods
    func takePhotoAction() {
        
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.Camera
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.presentViewController(cameraPicker, animated: true, completion: nil)
            
        }
        else{
            print("Camera error")
            
        }
        
    }
    
    func selectPhotoAction() {
     
        
        // フォトライブラリを使用できるか確認
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            // フォトライブラリの画像・写真選択画面を表示
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .PhotoLibrary
            imagePickerController.allowsEditing = true
            imagePickerController.delegate = self
            presentViewController(imagePickerController, animated: true, completion: nil)
        }
        
    }
 
    
    // MARK: - Image selection delegate method
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        // 選択した画像・写真を取得し、imageViewに表示
//        if let info = editingInfo, let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage{
//            imageView.image = editedImage
//        }else{
//            imageView.image = image
//        }
        
        // フォトライブラリの画像・写真選択画面を閉じる
        picker.dismissViewControllerAnimated(true, completion: {
        
            // ぬりえ画面へ遷移
            print("goto image view")
            
            if let vc: ColoringViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ColoringViewController") as! ColoringViewController {
                vc.selectedImage = image
                self.presentViewController(vc, animated: true, completion: nil)
                
            }
            
            
            
        })
    }
    
    
}
