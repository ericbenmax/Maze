//
//  ViewController.swift
//  Maze
//
//  Created by 陳士偉 on 2021/4/1.
//

import UIKit



class ViewController: UIViewController {


    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var AnswerButtonOutlet: UIButton!
    @IBOutlet weak var closeButtonOutlet: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var winImage: UILabel!

    
   
    
    
    
    let imageView = UIImageView(image: UIImage(named: "test"))
    let winView = UIImageView(image: UIImage(named: "sticker"))
    let looseView = UIImageView(image: UIImage(named: "loose"))
    let exit = [130, 330, 450]
    var empty: [Int] = []
    let exitA = UILabel(frame: CGRect(x: 350, y: 130, width: 12, height: 21))
    let exitB = UILabel(frame: CGRect(x: 350, y: 330, width: 12, height: 21))
    let exitC = UILabel(frame: CGRect(x: 350, y: 450, width: 12, height: 21))
    
    
    
  
    func randomChange(){
        
        let random = exit.randomElement()!
        empty.append(random)
        for compare in exit {
            if empty[0] != compare{
                empty.append(compare)
            
            }
        }
    }//將隨機產出的值與剩下的值放進空array
        
    
    func winner(){

        view.addSubview(winView)
        starLayer.removeFromSuperlayer()
        winView.frame = CGRect(x: 10, y: 75, width: 350, height: 400)
        upButton.alpha = 0
        downButton.alpha = 0
        leftButton.alpha = 0
        rightButton.alpha = 0
        AnswerButtonOutlet.alpha = 0
        closeButtonOutlet.alpha = 0
        answerLabel.alpha = 0
        exitA.alpha = 0
        exitB.alpha = 0
        exitC.alpha = 0
        imageView.alpha = 0
        UIView.animate(withDuration: 1.5, animations: {
            self.winView.alpha = 1
            self.winImage.alpha = 1
            self.resetButton.alpha = 1
        }
        )
    }//設定win畫面
    
    func looser(){
        
        view.addSubview(looseView)
        starLayer.removeFromSuperlayer()
        looseView.frame = CGRect(x: 10, y: 75, width: 350, height: 450)
        upButton.alpha = 0
        downButton.alpha = 0
        leftButton.alpha = 0
        rightButton.alpha = 0
        AnswerButtonOutlet.alpha = 0
        closeButtonOutlet.alpha = 0
        answerLabel.alpha = 0
        exitA.alpha = 0
        exitB.alpha = 0
        exitC.alpha = 0
        imageView.alpha = 0
        UIView.animate(withDuration: 1.5, animations:{
            self.looseView.alpha = 1
            self.resetButton.alpha = 1
        }
        )
    }//設定loose畫面
    
    func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
        CGColor(srgbRed: 253/255, green: 244/255, blue: 127/255, alpha: 1),
        CGColor(srgbRed: 190/255, green: 223/255, blue: 242/255, alpha: 1)
         ]
        gradientLayer.locations = [0, 0.7]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }//設定漸層
  
    func initial(){
        
        imageView.frame = CGRect(x: 30, y: 310, width: 20, height: 20)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        view.addSubview(imageView)
        view.addSubview(winImage)
        exitA.text = "A"
        exitA.textColor = .red
        exitB.text = "B"
        exitB.textColor = .red
        exitC.text = "C"
        exitC.textColor = .red
        exitA.alpha = 1
        exitB.alpha = 1
        exitC.alpha = 1
        winView.alpha = 0
        looseView.alpha = 0
        imageView.alpha = 1
        upButton.alpha = 1
        downButton.alpha = 1
        leftButton.alpha = 1
        rightButton.alpha = 1
        resetButton.alpha = 0
        winImage.alpha = 0
        view.addSubview(exitA)
        view.addSubview(exitB)
        view.addSubview(exitC)
        makeUIView()
        setupGradientBackground()
        }//設定初始值
    
    
    func leftShift(){
        
        imageView.frame = imageView.frame.offsetBy(dx: -10, dy: 0)
    }
    
    func rightShift(){
        
        imageView.frame = imageView.frame.offsetBy(dx: 10, dy: 0)
    }
    
    func upShift(){
        
        imageView.frame = imageView.frame.offsetBy(dx: 0, dy: -10)
    }
    
    func downShift(){
        
        imageView.frame = imageView.frame.offsetBy(dx: 0, dy: 10)
    }//設定四個按鈕
    
    

    let starLayer = CAShapeLayer()
    
    func makeUIView(){
       
        let path = UIBezierPath()
       
        path.move(to: CGPoint(x: 20, y: 300))
        path.addLine(to: CGPoint(x: 20, y: 80))
        path.addLine(to: CGPoint(x: 340, y: 80))
        path.addLine(to: CGPoint(x: 340, y: 120))
        path.addLine(to: CGPoint(x: 300, y: 120))
        path.move(to: CGPoint(x: 20, y: 300))
        path.addLine(to: CGPoint(x: 100, y: 300))
        path.addLine(to: CGPoint(x: 100, y: 240))
        path.move(to: CGPoint(x: 20, y: 120))
        path.addLine(to: CGPoint(x: 100, y: 120))
        path.addLine(to: CGPoint(x: 100, y: 160))
        path.addLine(to: CGPoint(x: 140, y: 160))
        path.addLine(to: CGPoint(x: 140, y: 120))
        path.move(to: CGPoint(x: 140, y: 160))
        path.addLine(to: CGPoint(x: 140, y: 200))
        path.addLine(to: CGPoint(x: 60, y: 200))
        path.addLine(to: CGPoint(x: 60, y: 160))
        path.move(to: CGPoint(x: 60, y: 200))
        path.addLine(to: CGPoint(x: 60, y: 260))
        path.move(to: CGPoint(x: 180, y: 120))
        path.addLine(to: CGPoint(x: 180, y: 240))
        path.addLine(to: CGPoint(x: 140, y: 240))
        path.addLine(to: CGPoint(x: 140, y: 300))
        path.move(to: CGPoint(x: 220, y: 80))
        path.addLine(to: CGPoint(x: 220, y: 160))
        path.move(to: CGPoint(x: 340, y: 160))
        path.addLine(to: CGPoint(x: 260, y: 160))
        path.addLine(to: CGPoint(x: 260, y: 120))
        path.move(to: CGPoint(x: 260, y: 160))
        path.addLine(to: CGPoint(x: 260, y: 200))
        path.addLine(to: CGPoint(x: 220, y: 200))
        path.move(to: CGPoint(x: 340, y: 160))
        path.addLine(to: CGPoint(x: 340, y: 320))
        path.addLine(to: CGPoint(x: 300, y: 320))
        path.addLine(to: CGPoint(x: 300, y: 280))
        path.addLine(to: CGPoint(x: 220, y: 280))
        path.move(to: CGPoint(x: 300, y: 200))
        path.addLine(to: CGPoint(x: 300, y: 240))
        path.move(to: CGPoint(x: 180, y: 240))
        path.addLine(to: CGPoint(x: 300, y: 240))
        path.move(to: CGPoint(x: 340, y: 360))
        path.addLine(to: CGPoint(x: 260, y: 360))
        path.addLine(to: CGPoint(x: 260, y: 320))
        path.move(to: CGPoint(x: 340, y: 360))
        path.addLine(to: CGPoint(x: 340, y: 440))
        path.addLine(to: CGPoint(x: 300, y: 440))
        path.addLine(to: CGPoint(x: 300, y: 400))
        path.addLine(to: CGPoint(x: 220, y: 400))
        path.addLine(to: CGPoint(x: 220, y: 480))
        path.addLine(to: CGPoint(x: 140, y: 480))
        path.addLine(to: CGPoint(x: 140, y: 440))
        path.addLine(to: CGPoint(x: 60, y: 440))
        path.addLine(to: CGPoint(x: 60, y: 380))
        path.move(to: CGPoint(x: 60, y: 440))
        path.addLine(to: CGPoint(x: 60, y: 480))
        path.move(to: CGPoint(x: 100, y: 520))
        path.addLine(to: CGPoint(x: 100, y: 480))
        path.move(to: CGPoint(x: 260, y: 520))
        path.addLine(to: CGPoint(x: 260, y: 440))
        path.move(to: CGPoint(x: 100, y: 340))
        path.addLine(to: CGPoint(x: 180, y: 340))
        path.addLine(to: CGPoint(x: 180, y: 280))
        path.move(to: CGPoint(x: 180, y: 280))
        path.addLine(to: CGPoint(x: 180, y: 440))
        path.move(to: CGPoint(x: 140, y: 440))
        path.addLine(to: CGPoint(x: 140, y: 380))
        path.move(to: CGPoint(x: 220, y: 240))
        path.addLine(to: CGPoint(x: 220, y: 360))
        path.move(to: CGPoint(x: 20, y: 340))
        path.addLine(to: CGPoint(x: 100, y: 340))
        path.addLine(to: CGPoint(x: 100, y: 400))
        path.move(to: CGPoint(x: 20, y: 340))
        path.addLine(to: CGPoint(x: 20, y: 520))
        path.addLine(to: CGPoint(x: 340, y: 520))
        path.addLine(to: CGPoint(x: 340, y: 480))
        path.addLine(to: CGPoint(x: 300, y: 480))
        
        starLayer.path = path.cgPath
        starLayer.strokeColor = UIColor.black.cgColor
        starLayer.lineWidth = 2
        starLayer.fillColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
        view.layer.addSublayer(starLayer)
    }//設定迷宮本體
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        empty = []
        initial()
        randomChange()
        answerLabel.alpha = 0
        closeButtonOutlet.alpha = 0
    }//初始畫面

    
    
    
    
    @IBAction func leftButton(_ sender: Any) {
    

        if imageView.frame.origin.x == 30{
            imageView.frame.origin.x = 30
        }
        else if imageView.frame.origin.x == 110 && (imageView.frame.origin.y == 300 || imageView.frame.origin.y == 290 || imageView.frame.origin.y == 280 || imageView.frame.origin.y == 270 || imageView.frame.origin.y == 260 || imageView.frame.origin.y == 250 || imageView.frame.origin.y == 240 || imageView.frame.origin.y == 230 || imageView.frame.origin.y == 220 || imageView.frame.origin.y == 350 || imageView.frame.origin.y == 360 || imageView.frame.origin.y == 370 || imageView.frame.origin.y == 380 || imageView.frame.origin.y == 390 || imageView.frame.origin.y == 400 || imageView.frame.origin.y == 460 || imageView.frame.origin.y == 470 || imageView.frame.origin.y == 480 || imageView.frame.origin.y == 490){
                imageView.frame.origin.x = 110
        }
        else if imageView.frame.origin.x == 70 && (imageView.frame.origin.y == 140 || imageView.frame.origin.y == 150 || imageView.frame.origin.y == 160 || imageView.frame.origin.y == 170 || imageView.frame.origin.y == 210 || imageView.frame.origin.y == 220 || imageView.frame.origin.y == 230 || imageView.frame.origin.y == 240 || imageView.frame.origin.y == 250 || imageView.frame.origin.y == 260 || imageView.frame.origin.y == 410 || imageView.frame.origin.y == 400 || imageView.frame.origin.y == 390 || imageView.frame.origin.y == 380 || imageView.frame.origin.y == 370 || imageView.frame.origin.y == 360 || imageView.frame.origin.y == 480 || imageView.frame.origin.y == 470 || imageView.frame.origin.y == 460 || imageView.frame.origin.y == 450 || imageView.frame.origin.y == 440){
            imageView.frame.origin.x = 70
        }
        else if imageView.frame.origin.x == 150 && (imageView.frame.origin.y == 200 || imageView.frame.origin.y == 190 || imageView.frame.origin.y == 180 || imageView.frame.origin.y == 170 || imageView.frame.origin.y == 160 || imageView.frame.origin.y == 150 || imageView.frame.origin.y == 140 || imageView.frame.origin.y == 130 || imageView.frame.origin.y == 120 || imageView.frame.origin.y == 110 || imageView.frame.origin.y == 100 || imageView.frame.origin.y == 300 || imageView.frame.origin.y == 290 || imageView.frame.origin.y == 280 || imageView.frame.origin.y == 270 || imageView.frame.origin.y == 260 || imageView.frame.origin.y == 250 || imageView.frame.origin.y == 450 || imageView.frame.origin.y == 440 || imageView.frame.origin.y == 430 || imageView.frame.origin.y == 420 || imageView.frame.origin.y == 410 || imageView.frame.origin.y == 390 || imageView.frame.origin.y == 380 || imageView.frame.origin.y == 370 || imageView.frame.origin.y == 360){
            imageView.frame.origin.x = 150
        }
        else if imageView.frame.origin.x == 190 && (imageView.frame.origin.y == 100 || imageView.frame.origin.y == 110 || imageView.frame.origin.y == 120 || imageView.frame.origin.y == 130 || imageView.frame.origin.y == 140 || imageView.frame.origin.y == 150 || imageView.frame.origin.y == 160 || imageView.frame.origin.y == 170 || imageView.frame.origin.y == 180 || imageView.frame.origin.y == 190 || imageView.frame.origin.y == 200 || imageView.frame.origin.y == 210 || imageView.frame.origin.y == 260 || imageView.frame.origin.y == 270 || imageView.frame.origin.y == 280 || imageView.frame.origin.y == 290 || imageView.frame.origin.y == 300 || imageView.frame.origin.y == 310 || imageView.frame.origin.y == 320 || imageView.frame.origin.y == 330 || imageView.frame.origin.y == 340 || imageView.frame.origin.y == 350 || imageView.frame.origin.y == 360 || imageView.frame.origin.y == 370 || imageView.frame.origin.y == 380 || imageView.frame.origin.y == 390 || imageView.frame.origin.y == 400 ||  imageView.frame.origin.y == 410 || imageView.frame.origin.y == 420 || imageView.frame.origin.y == 430 || imageView.frame.origin.y == 440){
            imageView.frame.origin.x = 190
        }
        else if imageView.frame.origin.x == 230 && (imageView.frame.origin.y == 250 || imageView.frame.origin.y == 160 || imageView.frame.origin.y == 150 || imageView.frame.origin.y == 140 || imageView.frame.origin.y == 130 || imageView.frame.origin.y == 120 || imageView.frame.origin.y == 110 || imageView.frame.origin.y == 100 || imageView.frame.origin.y == 90 || imageView.frame.origin.y == 480 || imageView.frame.origin.y == 470 || imageView.frame.origin.y == 460 || imageView.frame.origin.y == 450 || imageView.frame.origin.y == 440 || imageView.frame.origin.y == 430 || imageView.frame.origin.y == 420 || imageView.frame.origin.y == 410 || imageView.frame.origin.y == 360 || imageView.frame.origin.y == 350 || imageView.frame.origin.y == 340 || imageView.frame.origin.y == 330 || imageView.frame.origin.y == 320 || imageView.frame.origin.y == 310 || imageView.frame.origin.y == 300 || imageView.frame.origin.y == 290){
            imageView.frame.origin.x = 230
        }
        else if imageView.frame.origin.x == 270 && (imageView.frame.origin.y == 100 || imageView.frame.origin.y == 110 || imageView.frame.origin.y == 120 || imageView.frame.origin.y == 130 || imageView.frame.origin.y == 200 || imageView.frame.origin.y == 190 || imageView.frame.origin.y == 180 || imageView.frame.origin.y == 170 || imageView.frame.origin.y == 420 || imageView.frame.origin.y == 430 || imageView.frame.origin.y == 440 || imageView.frame.origin.y == 450 || imageView.frame.origin.y == 460 || imageView.frame.origin.y == 470 || imageView.frame.origin.y == 480 || imageView.frame.origin.y == 490 || imageView.frame.origin.y == 300 || imageView.frame.origin.y == 310 || imageView.frame.origin.y == 320 || imageView.frame.origin.y == 330){
                imageView.frame.origin.x = 270
        }
        else if imageView.frame.origin.x == 310 && (imageView.frame.origin.y == 180 || imageView.frame.origin.y == 190 || imageView.frame.origin.y == 200 || imageView.frame.origin.y == 210 || imageView.frame.origin.y == 220 || imageView.frame.origin.y == 230 || imageView.frame.origin.y == 240 || imageView.frame.origin.y == 260 || imageView.frame.origin.y == 270 || imageView.frame.origin.y == 280 || imageView.frame.origin.y == 290 || imageView.frame.origin.y == 380 || imageView.frame.origin.y == 390 || imageView.frame.origin.y == 400 || imageView.frame.origin.y == 410){
                imageView.frame.origin.x = 310
        }
        else{
            leftShift()
        }
    }
    
    @IBAction func rightButton(_ sender: Any) {
     
        if imageView.frame.origin.x == 310 && imageView.frame.origin.y == CGFloat(empty[0]){
            winner()
        }
        else if imageView.frame.origin.x == 310 && (imageView.frame.origin.y == CGFloat(empty[1]) || imageView.frame.origin.y == CGFloat(empty[2])){
            looser()
        }
        else if imageView.frame.origin.x == 310 {
            imageView.frame.origin.x = 310
        }
        else if imageView.frame.origin.x == 110 && (imageView.frame.origin.y == 300 || imageView.frame.origin.y == 290 || imageView.frame.origin.y == 280 || imageView.frame.origin.y == 270 || imageView.frame.origin.y == 260 || imageView.frame.origin.y == 250 || imageView.frame.origin.y == 240 || imageView.frame.origin.y == 230 || imageView.frame.origin.y == 220 || imageView.frame.origin.y == 170 || imageView.frame.origin.y == 360 || imageView.frame.origin.y == 370 || imageView.frame.origin.y == 380 || imageView.frame.origin.y == 390 || imageView.frame.origin.y == 400 || imageView.frame.origin.y == 410 || imageView.frame.origin.y == 450 || imageView.frame.origin.y == 460 || imageView.frame.origin.y == 470 || imageView.frame.origin.y == 480){
                imageView.frame.origin.x = 110
        }
        else if imageView.frame.origin.x == 70 && (imageView.frame.origin.y == 130 || imageView.frame.origin.y == 140 || imageView.frame.origin.y == 150 || imageView.frame.origin.y == 160 || imageView.frame.origin.y == 220 || imageView.frame.origin.y == 230 || imageView.frame.origin.y == 240 || imageView.frame.origin.y == 250 || imageView.frame.origin.y == 260 || imageView.frame.origin.y == 270 || imageView.frame.origin.y == 400 || imageView.frame.origin.y == 390 || imageView.frame.origin.y == 380 || imageView.frame.origin.y == 370 || imageView.frame.origin.y == 360 || imageView.frame.origin.y == 350 || imageView.frame.origin.y == 490 || imageView.frame.origin.y == 480 || imageView.frame.origin.y == 470 || imageView.frame.origin.y == 460){
            imageView.frame.origin.x = 70
        }
        else if imageView.frame.origin.x == 30 && (imageView.frame.origin.y == 260 || imageView.frame.origin.y == 250 || imageView.frame.origin.y == 240 || imageView.frame.origin.y == 230 || imageView.frame.origin.y == 220 || imageView.frame.origin.y == 210 || imageView.frame.origin.y == 200 || imageView.frame.origin.y == 190 || imageView.frame.origin.y == 180 || imageView.frame.origin.y == 170 || imageView.frame.origin.y == 160 || imageView.frame.origin.y == 150 || imageView.frame.origin.y == 140 || imageView.frame.origin.y == 360 || imageView.frame.origin.y == 370 || imageView.frame.origin.y == 380 || imageView.frame.origin.y == 390 || imageView.frame.origin.y == 400 || imageView.frame.origin.y == 410 || imageView.frame.origin.y == 420 || imageView.frame.origin.y == 430 || imageView.frame.origin.y == 440 || imageView.frame.origin.y == 450 || imageView.frame.origin.y == 460 || imageView.frame.origin.y == 470 || imageView.frame.origin.y == 480){
            imageView.frame.origin.x = 30
        }
        else if imageView.frame.origin.x == 150 && (imageView.frame.origin.y == 210 || imageView.frame.origin.y == 200 || imageView.frame.origin.y == 190 || imageView.frame.origin.y == 180 || imageView.frame.origin.y == 170 || imageView.frame.origin.y == 160 || imageView.frame.origin.y == 150 || imageView.frame.origin.y == 140 || imageView.frame.origin.y == 130 || imageView.frame.origin.y == 120 || imageView.frame.origin.y == 110 || imageView.frame.origin.y == 100 || imageView.frame.origin.y == 310 || imageView.frame.origin.y == 300 || imageView.frame.origin.y == 290 || imageView.frame.origin.y == 280 || imageView.frame.origin.y == 270 || imageView.frame.origin.y == 260 || imageView.frame.origin.y == 440 || imageView.frame.origin.y == 430 || imageView.frame.origin.y == 420 || imageView.frame.origin.y == 410 || imageView.frame.origin.y == 390 || imageView.frame.origin.y == 380 || imageView.frame.origin.y == 370 || imageView.frame.origin.y == 360 || imageView.frame.origin.y == 350){
            imageView.frame.origin.x = 150
        }
        else if imageView.frame.origin.x == 190 && (imageView.frame.origin.y == 90 || imageView.frame.origin.y == 100 || imageView.frame.origin.y == 110 || imageView.frame.origin.y == 120 || imageView.frame.origin.y == 130 || imageView.frame.origin.y == 140 || imageView.frame.origin.y == 150 || imageView.frame.origin.y == 160 || imageView.frame.origin.y == 180 || imageView.frame.origin.y == 190 || imageView.frame.origin.y == 200 || imageView.frame.origin.y == 250 || imageView.frame.origin.y == 260 || imageView.frame.origin.y == 270 || imageView.frame.origin.y == 280 || imageView.frame.origin.y == 290 || imageView.frame.origin.y == 300 || imageView.frame.origin.y == 310 || imageView.frame.origin.y == 320 || imageView.frame.origin.y == 330 || imageView.frame.origin.y == 340 || imageView.frame.origin.y == 350 || imageView.frame.origin.y == 360 || imageView.frame.origin.y == 380 || imageView.frame.origin.y == 390 || imageView.frame.origin.y == 400 ||  imageView.frame.origin.y == 410 || imageView.frame.origin.y == 420 || imageView.frame.origin.y == 430 || imageView.frame.origin.y == 440 || imageView.frame.origin.y == 450){
            imageView.frame.origin.x = 190
        }
        else if imageView.frame.origin.x == 230 && (imageView.frame.origin.y == 170 || imageView.frame.origin.y == 160 || imageView.frame.origin.y == 150 || imageView.frame.origin.y == 140 || imageView.frame.origin.y == 130 || imageView.frame.origin.y == 120 || imageView.frame.origin.y == 110 || imageView.frame.origin.y == 100 || imageView.frame.origin.y == 490 || imageView.frame.origin.y == 480 || imageView.frame.origin.y == 470 || imageView.frame.origin.y == 460 || imageView.frame.origin.y == 450 || imageView.frame.origin.y == 440 || imageView.frame.origin.y == 430 || imageView.frame.origin.y == 420 || imageView.frame.origin.y == 360 || imageView.frame.origin.y == 350 || imageView.frame.origin.y == 340 || imageView.frame.origin.y == 330 || imageView.frame.origin.y == 320 || imageView.frame.origin.y == 310 || imageView.frame.origin.y == 300){
            imageView.frame.origin.x = 230
        }
        else if imageView.frame.origin.x == 270 && (imageView.frame.origin.y == 100 || imageView.frame.origin.y == 110 || imageView.frame.origin.y == 120 || imageView.frame.origin.y == 210 || imageView.frame.origin.y == 200 || imageView.frame.origin.y == 190 || imageView.frame.origin.y == 180 || imageView.frame.origin.y == 410 || imageView.frame.origin.y == 420 || imageView.frame.origin.y == 430 || imageView.frame.origin.y == 440 || imageView.frame.origin.y == 460 || imageView.frame.origin.y == 470 || imageView.frame.origin.y == 480 || imageView.frame.origin.y == 290 || imageView.frame.origin.y == 300 || imageView.frame.origin.y == 310 || imageView.frame.origin.y == 320){
                imageView.frame.origin.x = 270
        }
        else{
            rightShift()
        }
        
    }
    
    
    @IBAction func upButton(_ sender: Any) {
        
        
        if imageView.frame.origin.y == 90 {
            imageView.frame.origin.y = 90
        }
        else if imageView.frame.origin.y == 310 && (imageView.frame.origin.x == 20 || imageView.frame.origin.x == 30 || imageView.frame.origin.x == 40 || imageView.frame.origin.x == 50 || imageView.frame.origin.x == 60 || imageView.frame.origin.x == 70 || imageView.frame.origin.x == 80 || imageView.frame.origin.x == 90 || imageView.frame.origin.x == 100 || imageView.frame.origin.x == 120 || imageView.frame.origin.x == 130 || imageView.frame.origin.x == 140){
            imageView.frame.origin.y = 310
            
        }
        else if imageView.frame.origin.y == 210 && (imageView.frame.origin.x == 110 || imageView.frame.origin.x == 120 || imageView.frame.origin.x == 130 || imageView.frame.origin.x == 140 || imageView.frame.origin.x == 110 || imageView.frame.origin.x == 100 || imageView.frame.origin.x == 90 || imageView.frame.origin.x == 80 || imageView.frame.origin.x == 70 || imageView.frame.origin.x == 200 || imageView.frame.origin.x == 210 || imageView.frame.origin.x == 220 || imageView.frame.origin.x == 230 || imageView.frame.origin.x == 240 || imageView.frame.origin.x == 250 || imageView.frame.origin.x == 260){
            imageView.frame.origin.y = 210
        }
        else if imageView.frame.origin.y == 270 && (imageView.frame.origin.x == 60 || imageView.frame.origin.x == 50 || imageView.frame.origin.x == 40){
            imageView.frame.origin.y = 270
        }
        else if imageView.frame.origin.y == 130 && (imageView.frame.origin.x == 30 || imageView.frame.origin.x == 40 || imageView.frame.origin.x == 50 || imageView.frame.origin.x == 60 || imageView.frame.origin.x == 70 || imageView.frame.origin.x == 280 || imageView.frame.origin.x == 290 || imageView.frame.origin.x == 300 || imageView.frame.origin.x == 310){
            imageView.frame.origin.y = 130
        }
        else if imageView.frame.origin.y == 170 && (imageView.frame.origin.x == 80 || imageView.frame.origin.x == 90 || imageView.frame.origin.x == 100 || imageView.frame.origin.x == 110 || imageView.frame.origin.x == 200 || imageView.frame.origin.x == 210 || imageView.frame.origin.x == 220 || imageView.frame.origin.x == 270 || imageView.frame.origin.x == 280 || imageView.frame.origin.x == 290 || imageView.frame.origin.x == 300 || imageView.frame.origin.x == 310){
            imageView.frame.origin.y = 170
        }
        else if imageView.frame.origin.y == 250 && (imageView.frame.origin.x == 300 || imageView.frame.origin.x == 290 || imageView.frame.origin.x == 280 || imageView.frame.origin.x == 270 || imageView.frame.origin.x == 260 || imageView.frame.origin.x == 250 || imageView.frame.origin.x == 240 || imageView.frame.origin.x == 230 || imageView.frame.origin.x == 150 || imageView.frame.origin.x == 160 || imageView.frame.origin.x == 170 || imageView.frame.origin.x == 180 || imageView.frame.origin.x == 190){
            imageView.frame.origin.y = 250
        }
        else if imageView.frame.origin.y == 450 && (imageView.frame.origin.x == 70 || imageView.frame.origin.x == 80 || imageView.frame.origin.x == 90 || imageView.frame.origin.x == 100 || imageView.frame.origin.x == 110 || imageView.frame.origin.x == 180 || imageView.frame.origin.x == 170 || imageView.frame.origin.x == 160 || imageView.frame.origin.x == 280 || imageView.frame.origin.x == 290 || imageView.frame.origin.x == 300 || imageView.frame.origin.x == 310){
            imageView.frame.origin.y = 450
        }
        else if imageView.frame.origin.y == 350 && (imageView.frame.origin.x == 150 || imageView.frame.origin.x == 140 || imageView.frame.origin.x == 130 || imageView.frame.origin.x == 120 || imageView.frame.origin.x == 110 || imageView.frame.origin.x == 70 || imageView.frame.origin.x == 60 || imageView.frame.origin.x == 50 || imageView.frame.origin.x == 40 || imageView.frame.origin.x == 30){
            imageView.frame.origin.y = 350
        }
        else if imageView.frame.origin.y == 410 && (imageView.frame.origin.x == 100 || imageView.frame.origin.x == 90 || imageView.frame.origin.x == 80 || imageView.frame.origin.x == 230 || imageView.frame.origin.x == 240 || imageView.frame.origin.x == 250 || imageView.frame.origin.x == 260 || imageView.frame.origin.x == 270){
            imageView.frame.origin.y = 410
        }
        else if imageView.frame.origin.y == 480 && (imageView.frame.origin.x == 40 || imageView.frame.origin.x == 50 || imageView.frame.origin.x == 60){
            imageView.frame.origin.y = 350
        }
        else if imageView.frame.origin.y == 490 && (imageView.frame.origin.x == 120 || imageView.frame.origin.x == 130 || imageView.frame.origin.x == 140 || imageView.frame.origin.x == 150 || imageView.frame.origin.x == 160 || imageView.frame.origin.x == 170 || imageView.frame.origin.x == 180 || imageView.frame.origin.x == 190 || imageView.frame.origin.x == 200 || imageView.frame.origin.x == 210 || imageView.frame.origin.x == 220 || imageView.frame.origin.x == 280 || imageView.frame.origin.x == 290 || imageView.frame.origin.x == 300 || imageView.frame.origin.x == 310){
            imageView.frame.origin.y = 490
        }
        else if imageView.frame.origin.y == 370 && (imageView.frame.origin.x == 200 || imageView.frame.origin.x == 210 || imageView.frame.origin.x == 220 || imageView.frame.origin.x == 240 || imageView.frame.origin.x == 250 || imageView.frame.origin.x == 260 || imageView.frame.origin.x == 270 || imageView.frame.origin.x == 280 || imageView.frame.origin.x == 290 || imageView.frame.origin.x == 300 || imageView.frame.origin.x == 310){
            imageView.frame.origin.y = 370
        }
        else if imageView.frame.origin.y == 290 && (imageView.frame.origin.x == 230 || imageView.frame.origin.x == 240 || imageView.frame.origin.x == 250 || imageView.frame.origin.x == 260 || imageView.frame.origin.x == 270){
            imageView.frame.origin.y = 290
        }
        else if imageView.frame.origin.y == 330 && (imageView.frame.origin.x == 280 || imageView.frame.origin.x == 290 || imageView.frame.origin.x == 300 || imageView.frame.origin.x == 310){
            imageView.frame.origin.y = 330
        }
        else{
            upShift()
        }
    }
    
    
    @IBAction func downButton(_ sender: Any) {
        
        
        if imageView.frame.origin.y == 490 {
            imageView.frame.origin.y = 490
        }
        else if imageView.frame.origin.y == 310 && (imageView.frame.origin.x == 20 || imageView.frame.origin.x == 30 || imageView.frame.origin.x == 40 || imageView.frame.origin.x == 50 || imageView.frame.origin.x == 60 || imageView.frame.origin.x == 70 || imageView.frame.origin.x == 80 || imageView.frame.origin.x == 90 || imageView.frame.origin.x == 100 || imageView.frame.origin.x == 110 || imageView.frame.origin.x == 120 || imageView.frame.origin.x == 130 || imageView.frame.origin.x == 140 || imageView.frame.origin.x == 150){
            imageView.frame.origin.y = 310
            
        }
        else if imageView.frame.origin.y == 210 && (imageView.frame.origin.x == 120 || imageView.frame.origin.x == 130 || imageView.frame.origin.x == 140 || imageView.frame.origin.x == 150 || imageView.frame.origin.x == 100 || imageView.frame.origin.x == 90 || imageView.frame.origin.x == 80 || imageView.frame.origin.x == 190 || imageView.frame.origin.x == 200 || imageView.frame.origin.x == 210 || imageView.frame.origin.x == 220 || imageView.frame.origin.x == 230 || imageView.frame.origin.x == 240 || imageView.frame.origin.x == 250 || imageView.frame.origin.x == 260 || imageView.frame.origin.x == 270){
            imageView.frame.origin.y = 210
        }
        else if imageView.frame.origin.y == 270 && (imageView.frame.origin.x == 70 || imageView.frame.origin.x == 60 || imageView.frame.origin.x == 50 || imageView.frame.origin.x == 40 || imageView.frame.origin.x == 30){
            imageView.frame.origin.y = 270
        }
        else if imageView.frame.origin.y == 130 && (imageView.frame.origin.x == 40 || imageView.frame.origin.x == 40 || imageView.frame.origin.x == 50 || imageView.frame.origin.x == 60 || imageView.frame.origin.x == 270 || imageView.frame.origin.x == 280 || imageView.frame.origin.x == 290 || imageView.frame.origin.x == 300 || imageView.frame.origin.x == 310){
            imageView.frame.origin.y = 130
        }
        else if imageView.frame.origin.y == 170 && (imageView.frame.origin.x == 70 || imageView.frame.origin.x == 80 || imageView.frame.origin.x == 90 || imageView.frame.origin.x == 100 || imageView.frame.origin.x == 110 || imageView.frame.origin.x == 200 || imageView.frame.origin.x == 210 || imageView.frame.origin.x == 220 || imageView.frame.origin.x == 230 || imageView.frame.origin.x == 280 || imageView.frame.origin.x == 290 || imageView.frame.origin.x == 300){
            imageView.frame.origin.y = 170
        }
        else if imageView.frame.origin.y == 90 && (imageView.frame.origin.x == 240 || imageView.frame.origin.x == 250 || imageView.frame.origin.x == 260 || imageView.frame.origin.x == 280 || imageView.frame.origin.x == 290 || imageView.frame.origin.x == 300 || imageView.frame.origin.x == 310 || imageView.frame.origin.x == 160 || imageView.frame.origin.x == 170 || imageView.frame.origin.x == 180 || imageView.frame.origin.x == 140 || imageView.frame.origin.x == 130 || imageView.frame.origin.x == 120 || imageView.frame.origin.x == 100 || imageView.frame.origin.x == 110 || imageView.frame.origin.x == 90 || imageView.frame.origin.x == 80 || imageView.frame.origin.x == 70 || imageView.frame.origin.x == 60 || imageView.frame.origin.x == 50 || imageView.frame.origin.x == 30){
            imageView.frame.origin.y = 90
        }
        else if imageView.frame.origin.y == 250 && (imageView.frame.origin.x == 300 || imageView.frame.origin.x == 290 || imageView.frame.origin.x == 280 || imageView.frame.origin.x == 270 || imageView.frame.origin.x == 260 || imageView.frame.origin.x == 250 || imageView.frame.origin.x == 240 || imageView.frame.origin.x == 230 || imageView.frame.origin.x == 160 || imageView.frame.origin.x == 170 || imageView.frame.origin.x == 180){
            imageView.frame.origin.y = 250
        }
        else if imageView.frame.origin.y == 290 && (imageView.frame.origin.x == 310 || imageView.frame.origin.x == 240 || imageView.frame.origin.x == 250 || imageView.frame.origin.x == 260){
            imageView.frame.origin.y = 290
        }
        else if imageView.frame.origin.y == 450 && (imageView.frame.origin.x == 190 || imageView.frame.origin.x == 180 || imageView.frame.origin.x == 170 || imageView.frame.origin.x == 160 || imageView.frame.origin.x == 150 || imageView.frame.origin.x == 280 || imageView.frame.origin.x == 290 || imageView.frame.origin.x == 300 || imageView.frame.origin.x == 310){
            imageView.frame.origin.y = 450
        }
        else if imageView.frame.origin.y == 350 && (imageView.frame.origin.x == 140 || imageView.frame.origin.x == 130 || imageView.frame.origin.x == 120 || imageView.frame.origin.x == 60 || imageView.frame.origin.x == 50 || imageView.frame.origin.x == 40){
            imageView.frame.origin.y = 350
        }
        else if imageView.frame.origin.y == 410 && (imageView.frame.origin.x == 110 || imageView.frame.origin.x == 100 || imageView.frame.origin.x == 90 || imageView.frame.origin.x == 80 || imageView.frame.origin.x == 70 || imageView.frame.origin.x == 240 || imageView.frame.origin.x == 250 || imageView.frame.origin.x == 260 || imageView.frame.origin.x == 280 || imageView.frame.origin.x == 290 || imageView.frame.origin.x == 300 || imageView.frame.origin.x == 310){
            imageView.frame.origin.y = 410
        }
        else if imageView.frame.origin.y == 450 && (imageView.frame.origin.x == 80 || imageView.frame.origin.x == 90 || imageView.frame.origin.x == 100){
            imageView.frame.origin.y = 450
        }
        else if imageView.frame.origin.y == 370 && (imageView.frame.origin.x == 200 || imageView.frame.origin.x == 210 || imageView.frame.origin.x == 220 || imageView.frame.origin.x == 230 || imageView.frame.origin.x == 240 || imageView.frame.origin.x == 250 || imageView.frame.origin.x == 260 || imageView.frame.origin.x == 270 || imageView.frame.origin.x == 280 || imageView.frame.origin.x == 290 || imageView.frame.origin.x == 300){
            imageView.frame.origin.y = 370
        }
        else if imageView.frame.origin.y == 330 && (imageView.frame.origin.x == 270 || imageView.frame.origin.x == 280 || imageView.frame.origin.x == 290 || imageView.frame.origin.x == 300 || imageView.frame.origin.x == 310){
            imageView.frame.origin.y = 330
        }
        else{
            downShift()
        }
    }//設定迷宮禁制區

    
    
    @IBAction func resetButton(_ sender: Any) {
        
        
        answerLabel.alpha = 0
        closeButtonOutlet.alpha = 0
        AnswerButtonOutlet.alpha = 1
        if imageView.frame.origin.x == 310 && imageView.frame.origin.y == CGFloat(empty[0]){
            empty = []
            initial()
            randomChange()
        }
        else{
            initial()
        }
    }//設定Reset功能

    @IBAction func answerButton(_ sender: Any) {
        
        var i: String
        if empty[0] == 130 {
            i = "A"
        }
        else if empty[0] == 330{
            i = "B"
        }
        else{
            i = "C"
        }
        answerLabel.text = i
        answerLabel.alpha = 1
        closeButtonOutlet.alpha = 1
        AnswerButtonOutlet.alpha = 0
        
    }//設定答案Button
    
    @IBAction func closeButton(_ sender: Any) {
        
        answerLabel.alpha = 0
        closeButtonOutlet.alpha = 0
        AnswerButtonOutlet.alpha = 1
    }//設定關閉答案Button
    
}
