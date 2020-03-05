//
//  HomesViewController.swift
//  Desafio
//
//  Created by Joao Batista on 04/03/20.
//  Copyright © 2020 Joao Batista. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit
class HomesViewController: UIViewController {
    let customView = Home()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        play()
        
    }
    override func loadView() {
        view = customView
    }
    
    func play() {
        
        guard let videoURL: URL = URL(string: "https://d35mkqei6qg744.cloudfront.net/pt/videos/1felicidadegenuina.mp4") else {
            return print("Deu merda em")
        }
            let player = AVPlayer(url: videoURL)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            self.present(playerViewController, animated: true) {
                playerViewController.player!.play()
            }
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
