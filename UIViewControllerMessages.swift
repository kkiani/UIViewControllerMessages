//
//  UIViewControllerExtension.swift
//  Epizod
//
//  Created by Kiarash Kiani on 11/25/18.
//  Copyright © 2018 avinvance. All rights reserved.
//

import UIKit

extension UIViewController{
    var messageView:UIView{
        get{
            for view in self.view.subviews{
                if view.restorationIdentifier == "messageView"{
                    return view
                }
            }
            
            let message_view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            self.view.addSubview(message_view)
            NSLayoutConstraint.activate([
                message_view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                message_view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                message_view.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                message_view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
                ])
            
            message_view.restorationIdentifier = "messageView"
            message_view.translatesAutoresizingMaskIntoConstraints = false
            message_view.backgroundColor = UIColor(red:0.84, green:0.21, blue:0.22, alpha:1.00)
            
            return message_view
        }
    }
    
    func messageLoading(){
        messageView.removeAllSubviews()
        
        let loadingView = UIActivityIndicatorView(style: .white)
        messageView.addSubview(loadingView)
        loadingView.startAnimating()
        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: loadingView.superview!.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: loadingView.superview!.centerYAnchor),
            loadingView.heightAnchor.constraint(equalToConstant: loadingView.frame.size.height),
            loadingView.widthAnchor.constraint(equalToConstant: loadingView.frame.size.width)
            ])
        
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        
        let title = UILabel(frame: CGRect.zero)
        title.text = "لطفا منتظر بمانید"
        title.textColor = UIColor.white
        title.font = UIFont(name: "Vazir-FD", size: 12)!
        title.sizeToFit()
        title.textAlignment = .center
        messageView.addSubview(title)
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: title.superview!.centerXAnchor),
            title.topAnchor.constraint(equalTo: loadingView.bottomAnchor, constant: 16),
            ])
        
        title.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    func messageError(_ error:String="اشکال در ارتباط با سرور!"){
        messageView.removeAllSubviews()
        
        let title = UILabel(frame: CGRect.zero)
        title.text = error
        title.textColor = UIColor.white
        title.font = UIFont(name: "Vazir-FD", size: 12)!
        title.numberOfLines = 4
        title.textAlignment = .center
        messageView.addSubview(title)
        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: title.superview!.centerYAnchor),
            title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            ])
        title.sizeToFit()
        
        title.translatesAutoresizingMaskIntoConstraints = false
        
        let reload = GButton()
        reload.setTitle("دوباره تلاش کن", for: .normal)
        reload.setTitleColor(UIColor.white, for: .normal)
        reload.titleLabel?.font = UIFont(name: "Vazir-FD", size: 12)!
        reload.clipsToBounds = true
        
        reload.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        messageView.addSubview(reload)
        NSLayoutConstraint.activate([
            reload.centerXAnchor.constraint(equalTo: reload.superview!.centerXAnchor),
            reload.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            reload.widthAnchor.constraint(equalToConstant: 100),
            ])
        
        reload.layer.cornerRadius = 15
        reload.addTarget(self, action: #selector(reload_Tapped), for: .touchUpInside)
        reload.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func messageHide(){
        messageView.removeFromSuperview()
    }
    
    @objc func reload_Tapped(){
        print("reload button not implemented!.")
    }
}
