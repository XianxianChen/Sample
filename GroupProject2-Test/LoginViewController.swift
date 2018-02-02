//
//  ViewController.swift
//  GroupProject2-Test
//
//  Created by C4Q on 2/2/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let userLoginView = UserLoginView()
    let userSignUpView = SignUpView()
    let segmentControllView = SegmentedControllView()
    var verificationTimer: Timer = Timer() //For email verification
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
  
        
        
        let views = [segmentControllView, userLoginView, userSignUpView] as [UIView]
        views.forEach({$0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        })
        userSignUpView.isHidden = true
        
        segmentControllView.segmentControll.addTarget(self, action: #selector(segmentControlPressed(sender:)), for: .touchUpInside)
        
        
        setUpAccountView()
        userSignUpViewConstraints()
        userCreateAccountConstraints()
    }

    @objc func segmentControlPressed(sender: UISegmentedControl)  {
        if sender.selectedSegmentIndex == 0 {
            userLoginView.isHidden = false
            userSignUpView.isHidden = true
            print("\(String(describing: sender.titleForSegment(at: 0)))")
        }
            
        else if sender.selectedSegmentIndex == 1 {
            userLoginView.isHidden = true
            userSignUpView.isHidden = false
            print("\(String(describing: sender.titleForSegment(at: 1)))")
        }
    }
    
    
    func setUpAccountView() {
        segmentControllView.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(view.snp.height).multipliedBy(0.8)
            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY).offset(20)
            
            
        }
    }
    
    func userSignUpViewConstraints() {
        userSignUpView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(segmentControllView.segmentControll.snp.bottom).offset(2)
            make.width.equalTo(segmentControllView.snp.width).multipliedBy(0.99)
            make.height.equalTo(segmentControllView.borderForViews.snp.height).multipliedBy(0.99)
            make.centerX.equalTo(segmentControllView.segmentControll.snp.centerX)
        }
    }
    
    func userCreateAccountConstraints() {
        userLoginView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(segmentControllView.segmentControll.snp.bottom).offset(2)
            make.width.equalTo(segmentControllView.snp.width).multipliedBy(0.99)
            make.height.equalTo(segmentControllView.borderForViews.snp.height).multipliedBy(0.99)
            make.centerX.equalTo(segmentControllView.segmentControll.snp.centerX)
            
        }
    }
    

}

