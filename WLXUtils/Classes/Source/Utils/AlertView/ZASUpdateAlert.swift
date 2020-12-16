//
//  ZASUpdateAlert.swift
//  ZASUpdateAlert
//
//  Created by ashen on 2018/3/7.
//  Copyright © 2018年 <http://www.devashen.com>. All rights reserved.
//

import UIKit
public class ZASUpdateAlert: UIView {
    
    /// 特别说明：appId可以是app的唯一标志(跳转到appStore)，也可以是http地址(跳转到Safari)
    @discardableResult
    public class func show(version ver:String, content:String, appId:String, isMustUpdate:Bool)->ZASUpdateAlert? {
        let alert = ZASUpdateAlert(version: ver, content: content, appId: appId, isMustUpdate: isMustUpdate)
        // 延迟添加到window上，防止在root视图还没有显示出来时，导致更新视图被root视图覆盖
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.168) {
            UIApplication.shared.delegate?.window!!.addSubview(alert)
        }
        return alert
    }
    
    private let alertMaxHeight = Size.screenWidth * 2 / 3
    private let topImageHeight:CGFloat = Size.screenWidth * 0.44
    private let lblVersionHeight:CGFloat = 28
    private let btnUpdateHeight:CGFloat = 40
    private let btnCancelWidth:CGFloat = 36
    
    private var upVersion = ""
    private var upContent = ""
    private var upAppId: String? = "http://www.devashen.com"
    private var upMustUpdate = false

    private var listTxt:UITextView!
    
    ///更新内容的字体大小
    public var txtFont:CGFloat = 17 {
        didSet {
            listTxt.font = UIFont.systemFont(ofSize: txtFont)
        }
    }
    
    init(version ver:String, content:String, appId:String, isMustUpdate:Bool) {
        super.init(frame: CGRect.zero)
        upVersion = ver
        upContent = content+"\n"
        upAppId = appId
        upMustUpdate = isMustUpdate
        makeUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc private func cancelAlertAction() {
        UIView.animate(withDuration: 0.3, animations: {
            self.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
            self.backgroundColor = UIColor.clear
            self.alpha = 0
        }) { _ in
            self.removeFromSuperview()
        }
    }
    
    @objc private func gotoUpdate() {
//        var appUrl = String(format:"itms-apps://itunes.apple.com/app/id%@",upAppId)
//        guard let appUrl = upAppId else {
//            cancelAlertAction()
//            return
//        }

//        let url = URL(string: appUrl)
//        if #available(iOS 10.0, *) {
//            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
//        } else {
//            UIApplication.shared.openURL(url!)
//        }
        if UIApplication.shared.canOpenURL(URL(string: "itms-beta://v1/app/1535634185")!) {
            UIApplication.shared.open(URL(string: "https://beta.itunes.apple.com/v1/app/1535634185")!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.open(URL(string: upAppId ?? "https://testflight.apple.com/join/6Zw4BJre")!, options: [:], completionHandler: nil)
        }
        cancelAlertAction()
    }
    
    // MARK: - Methods
    
    private func makeUI() {
        self.frame = UIScreen.main.bounds
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        
        var strHeight = self.sizeOfString(upContent).height
        let othersHeight = (topImageHeight + 20) + (lblVersionHeight + 10) + (btnUpdateHeight + 20 + 30)
        var isScrollList = false
        var realAlertHeight = strHeight + othersHeight
        if realAlertHeight > alertMaxHeight {
            realAlertHeight = alertMaxHeight
            strHeight = realAlertHeight - othersHeight
            isScrollList = true
        }
        
        let contentView = UIView(frame: CGRect.init(x: 0, y: 0, width: Size.screenWidth - 80, height: realAlertHeight))
        contentView.center = self.center
        contentView.backgroundColor = UIColor.white
        contentView.layer.cornerRadius = 4
        self.addSubview(contentView)
        
        let topImage = UIImageView(frame: CGRect.init(x: 0, y: 20, width: contentView.frame.width, height: topImageHeight))
        topImage.contentMode = .scaleAspectFit
        topImage.image = UIImage.image("update")
        contentView.addSubview(topImage)
        
        let lblVersion = UILabel(frame: CGRect.init(x: 0, y: topImage.frame.maxY + 10, width: contentView.frame.width, height: lblVersionHeight))
        lblVersion.font = UIFont.boldSystemFont(ofSize: 18)
        lblVersion.textAlignment = .center
        lblVersion.text = String(format:"发现新版本%@",upVersion)
        contentView.addSubview(lblVersion)
        lblVersion.textColor = UIColor.tertiaryLabelColor()
        
        listTxt = UITextView(frame: CGRect.init(x: 28, y: lblVersion.frame.maxY + 10, width: contentView.frame.width - 56, height: strHeight))
        listTxt.font = UIFont.systemFont(ofSize: 17)
        listTxt.text = upContent
        listTxt.isEditable = false
        listTxt.isSelectable = false
        listTxt.isScrollEnabled = isScrollList
        listTxt.showsVerticalScrollIndicator = isScrollList
        listTxt.showsHorizontalScrollIndicator = false
        listTxt.backgroundColor = .white
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        let attributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 17),
                          NSAttributedString.Key.paragraphStyle:style]
        listTxt.attributedText = NSAttributedString(string: listTxt.text, attributes: attributes)
        
        contentView.addSubview(listTxt)
        
        let btnUpdate = UIButton(type: .system)
        btnUpdate.frame = CGRect.init(x: 25, y: listTxt.frame.maxY + 20, width: contentView.frame.width - 50, height: btnUpdateHeight)
        btnUpdate.clipsToBounds = true
        btnUpdate.layer.cornerRadius = 2.0
        btnUpdate.backgroundColor = UIColor.mainTHemeColor
        btnUpdate.setTitleColor(UIColor.white, for: .normal)
        btnUpdate.setTitle("立即更新", for: .normal)
        btnUpdate.addTarget(self, action: #selector(gotoUpdate), for: UIControl.Event.touchUpInside)
        btnUpdate.setBorder(radius: Size.kAdaptWidth(4))
        contentView.addSubview(btnUpdate)
        
        if !upMustUpdate {
            let btnCancel = UIButton(type: .system)
            contentView.addSubview(btnCancel)
            btnCancel.snp_makeConstraints { (make) in
                make.top.equalToSuperview().offset(Size.size10)
                make.right.equalToSuperview().offset(-Size.size10)
                make.size.equalTo(Size.kAdaptSize(size: CGSize(width: 25, height: 25)))
            }
//            btnCancel.bounds = CGRect.init(x: contentView, y: 0, width: btnCancelWidth, height: btnCancelWidth)
//            btnCancel.center = CGPoint.init(x: contentView.frame.maxX, y: contentView.frame.minY)
            btnCancel.setImage(UIImage(named: "alert_cancel")?.withRenderingMode(.alwaysOriginal), for: .normal)
            btnCancel.addTarget(self, action: #selector(cancelAlertAction), for: UIControl.Event.touchUpInside)
        }
    }
    
    /// 获取字符串的size
    private func sizeOfString(_ str:String)->CGSize {
        let string = str as NSString
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        let attributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 17),
                          NSAttributedString.Key.paragraphStyle:style]
        let size = string.boundingRect(with: CGSize.init(width: Size.screenWidth - 80 - 56, height: 1000), options: NSStringDrawingOptions(rawValue: NSStringDrawingOptions.RawValue(UInt8(NSStringDrawingOptions.usesLineFragmentOrigin.rawValue) | UInt8(NSStringDrawingOptions.usesFontLeading.rawValue))), attributes:attributes, context: nil).size
        return size
    }
}
