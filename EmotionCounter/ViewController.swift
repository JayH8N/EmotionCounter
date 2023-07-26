//
//  ViewController.swift
//  EmotionCounter
//
//  Created by hoon on 2023/07/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var emoticons: [UIButton]!
    @IBOutlet var background: UIImageView!
    
    @IBOutlet var pullDownButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let array = Mood.allCases
        
        for i in 0...emoticons.count - 1 {
            emoticons[i].tag = array[i].rawValue
        }
        
        titleLabel.text = "OH MY MOOD"
        titleLabel.textAlignment = .center
        setEmoticons()
        background.image = UIImage(named: "launch")
        background.contentMode = .scaleAspectFill
        pullDownButton.setImage(UIImage(named: "ellipsis"), for: .normal)
    }
    
    //MARK: - 이모티콘사진 삽입 기능
    func setEmoticons() {
        for i in 0...emoticons.count - 1 {
            emoticons[i].setImage(UIImage(named: "emoji\(i + 1)"), for: .normal)
        }
    }
    
    
    //MARK: -
    @IBAction func imageTouched(_ sender: UIButton) {
        let first = userDefaults.integer(forKey: forKey.first.rawValue)
        let second = userDefaults.integer(forKey: forKey.second.rawValue)
        let third = userDefaults.integer(forKey: forKey.third.rawValue)
        let fourth = userDefaults.integer(forKey: forKey.fourth.rawValue)
        let fifth = userDefaults.integer(forKey: forKey.fifth.rawValue)
        
        switch Mood(rawValue: sender.tag) {
        case .happy:
            let result1 = first + 1
            userDefaults.set(result1, forKey: forKey.first.rawValue)
        case .smile:
            let result2 = second + 1
            userDefaults.set(result2, forKey: forKey.second.rawValue)
        case .blunt:
            let result3 = third + 1
            userDefaults.set(result3, forKey: forKey.third.rawValue)
        case .sadness:
            let result4 = fourth + 1
            userDefaults.set(result4, forKey: forKey.fourth.rawValue)
        case .blue:
            let result5 = fifth + 1
            userDefaults.set(result5, forKey: forKey.fifth.rawValue)
        default:
            break
        }
        
    }
    
}
