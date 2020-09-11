//
//  MenuViewController.swift
//  QUIZOEY
//
//  Created by El nino Cholo on 2020/09/09.
//  Copyright © 2020 El nino Cholo. All rights reserved.
//

import UIKit

class MenuViewController : UIViewController
{
    
    lazy var contentView : UIView =
    {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemRed
        view.addSubview(buttonView)
        buttonView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        return view
        
    }()
    
    private let logoView : UIImage =
    {
        let image = UIImage()
        
        return image
    }()
    
    
    lazy var buttonView :UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 800).isActive = true
        view.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        for(index,title) in titleView.enumerated()
        {
            let button = roundButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)
            button.backgroundColor = .black
            button.heightAnchor.constraint(equalToConstant: 60).isActive = true
            button.widthAnchor.constraint(equalToConstant: 120).isActive = true
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            button.setTitle(title, for: .normal)
            button.tag = index
            gameButtons.append(button)
        }
        
        gameButtons[0].topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        gameButtons[0].bottomAnchor.constraint(equalTo: gameButtons[1].topAnchor , constant: -10).isActive = true
        gameButtons[0].leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        gameButtons[0].rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        gameButtons[1].bottomAnchor.constraint(equalTo: gameButtons[2].topAnchor , constant: -10).isActive = true
        gameButtons[1].leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        gameButtons[1].rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        gameButtons[2].bottomAnchor.constraint(equalTo: gameButtons[3].topAnchor , constant: -10).isActive = true
        gameButtons[2].leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        gameButtons[2].rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        gameButtons[3].leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        gameButtons[3].rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
        return view
    }()
    private let Scoreview = UIView()
    
    
    private let TitleLabel : UILabel =
    {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        return label
    }()
    
    
    private let recentLabel: UILabel =
    {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        return label
    }()
    
    private let highscorelabel : UILabel =
    {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        return label
    }()
    
    var gameButtons = [roundButton]()
    
     let titleView = [
        "Multiple Choice",
        "Image Quizz",
        "Right or wrong",
        "Emoji Riddle"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QuizAppView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.isHidden = true
    }
    
    func QuizAppView()
    {
        self.view.backgroundColor = .white
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -10).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
    }
    
}
