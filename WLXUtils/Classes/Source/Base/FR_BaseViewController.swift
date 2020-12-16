//
//  FR_BaseViewController.swift
//  furongbook
//
//  Created by wlx on 2020/11/17.
//

import UIKit

open class FR_BaseViewController: UIViewController {

    open override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setupUI() {
        view.backgroundColor = UIColor.backgroundColor()
    }
    
    func getData() {
        
    }
    
    //设置导航栏右侧
    @discardableResult
    func setNavRight(title: String, imgStr: String? = nil, titleColor: UIColor?, font: UIFont?,_ action: @escaping (UIButton)->()) -> UIButton {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 44))
        btn.setTitle(title, for: UIControl.State.normal)
        btn.titleLabel?.font = font ?? UIFont.font14
        btn.contentHorizontalAlignment = .right
        if let str = imgStr {
            btn.setImage(UIImage.image(str), for: UIControl.State.normal)
        }
        btn.setTitleColor(titleColor ?? UIColor.labelColor(), for: UIControl.State.normal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn)
        btn.addTouchUpInSideBtnAction { (btn) in
            action(btn)
        }
        return btn
    }
}
