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
    //MARK: PROPERTY
    private var recentScore = [0,0,0,0]
    private var highScore = [0,0,0,0]
    private var scoreIndex = 0
    private var timer = Timer()
    
    var midX:[NSLayoutConstraint]!
    var leftConstraint:[NSLayoutConstraint]!
    var rightConstraint:[NSLayoutConstraint]!
    
    //MARK: Content View Of the the App
    var titletoAssigned:String?
   
    lazy var contentView : UIView =
    {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemRed
        view.addSubview(buttonView)
        view.addSubview(TitleLabel)
        view.addSubview(myScoreView)
        buttonView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        TitleLabel.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true
        TitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        TitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        TitleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        TitleLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        myScoreView.topAnchor.constraint(equalTo: TitleLabel.bottomAnchor, constant: 20).isActive = true
//        myScoreView.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 40)
//        myScoreView.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -40)
        
        midX = [myScoreView.centerXAnchor.constraint(equalTo: view.centerXAnchor)]
        leftConstraint = [myScoreView.leftAnchor.constraint(equalTo: view.leftAnchor)]
        rightConstraint = [myScoreView.rightAnchor.constraint(equalTo: view.rightAnchor)]
        
        NSLayoutConstraint.activate(midX)
        
        return view
        
    }()
    
    private let logoView : UIImage =
    {
        let image = UIImage()
        
        return image
    }()
    
    
     //MARK: Button View
    lazy var buttonView :UIView = {
        let view = UIView()
       
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.heightAnchor.constraint(equalToConstant: 400).isActive = true
        view.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        for(index,title) in titleView.enumerated()
        {
            let button = roundButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)
            button.backgroundColor = .black
            button.heightAnchor.constraint(equalToConstant: 80).isActive = true
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

    
    private let TitleLabel : UILabel =
    {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
   
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .white
        return label
    }()
     //MARK: Score view of the App
    lazy var myScoreView: UIView =
    {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(recentLabel)
        view.addSubview(highscorelabel)
        recentLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        recentLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        recentLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        highscorelabel.topAnchor.constraint(equalTo: recentLabel.bottomAnchor, constant: 10).isActive = true
        highscorelabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        highscorelabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
         
        TitleLabel.text = titleView[scoreIndex]
        recentLabel.text = "Recent Score : \(recentScore[scoreIndex])"
        highscorelabel.text = "HighScore : \(highScore[scoreIndex])"
        
        return view
    }()
    
     let recentLabel: UILabel =
    {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 60).isActive = true
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.clipsToBounds = true
        return label
    }()
    
     let highscorelabel : UILabel =
    {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.textColor = .white
         label.font = UIFont.boldSystemFont(ofSize: 20)
        label.heightAnchor.constraint(equalToConstant: 60).isActive = true
         label.clipsToBounds = true
        return label
    }()
    
    var gameButtons = [roundButton]()
    
     //MARK: Title on each buttons
     let titleView = [
        "MULTIPLE CHOICE",
        "IMAGE QUIZZ",
        "RIGHT OR WRONG",
        "EMOJI RIDDLE"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QuizAppView()
        updatescopre()
      
    }
    
    func updatescopre()
    {
        recentScore = [UserDefaults.standard.integer(forKey: MCRecentScore),
        UserDefaults.standard.integer(forKey: ImageRecentScore ),
        UserDefaults.standard.integer(forKey: RightWrongRecentScore),
        UserDefaults.standard.integer(forKey: EmojiRecentScore)]
        
        highScore = [UserDefaults.standard.integer(forKey: MChighestScoreId),
        UserDefaults.standard.integer(forKey: ImagehighestScoreId ),
        UserDefaults.standard.integer(forKey: RightWronghighestScoreId),
        UserDefaults.standard.integer(forKey: EmojihighestScoreId)]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.isHidden = true
        
    }
    
     //MARK: The main View behind the content View
    func QuizAppView()
    {
        self.view.backgroundColor = .white
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -10).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(nextScore), userInfo: nil, repeats: true)
    }
    
    
    @objc func nextScore()
    {
        if scoreIndex < (recentScore.count - 1)
        {
            scoreIndex += 1
        }else
        {
            scoreIndex = 0
        }
        UIView.animate(withDuration: 3.0, animations: {
            NSLayoutConstraint.deactivate(self.midX)
            NSLayoutConstraint.activate(self.leftConstraint)
            self.view.layoutIfNeeded()
        }) { (completion:Bool) in
            self.TitleLabel.text = self.titleView[self.scoreIndex]
            self.recentLabel.text = "Recent : \(self.recentScore[self.scoreIndex])"
            self.highscorelabel.text = "HighScore : \(self.highScore[self.scoreIndex])"
            NSLayoutConstraint.deactivate(self.leftConstraint)
            NSLayoutConstraint.activate(self.rightConstraint)
            self.view.layoutIfNeeded()
            
            UIView.animate(withDuration: 1.0) {
                NSLayoutConstraint.deactivate(self.rightConstraint)
                NSLayoutConstraint.activate(self.midX)
                self.view.layoutIfNeeded()
            }
        }
        
    }
}
