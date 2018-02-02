//
//  SegmentedControllView.swift
//  GroupProject2-Test
//
//  Created by C4Q on 2/2/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit
class SegmentedControllView: UIView {

    lazy var segmentControll: UISegmentedControl = {
        let segCon = UISegmentedControl(items: ["Log in", "Create Account"])
        segCon.tintColor = .orange
        segCon.backgroundColor = .blue
        return segCon
    }()

    
    lazy var borderForViews: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.orange.cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .blue
        setupViews()
    }
    
    private func setupViews() {
        let views = [segmentControll, borderForViews] as [UIView]
        views.forEach { addSubview($0); ($0).translatesAutoresizingMaskIntoConstraints = false}
        setUpSegCon()
        setUpUserView()
        
    }
    
    private func setUpSegCon() {
        segmentControll.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(self)
            make.height.equalTo(self).multipliedBy(0.2)
            make.centerX.equalTo(self)
            //            make.centerY.equalTo(self)
            make.top.equalTo(self)
        }
    }
    
    private func setUpUserView() {
        borderForViews.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(self).multipliedBy(0.8)
            make.width.equalTo(segmentControll.snp.width)
            make.top.equalTo(segmentControll.snp.bottom)
            make.centerX.equalTo(segmentControll.snp.centerX)
        }
        
    }
    
    
}

    


