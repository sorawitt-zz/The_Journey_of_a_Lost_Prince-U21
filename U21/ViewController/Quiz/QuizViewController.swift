//
//  QuizViewController.swift
//  U21
//
//  Created by Kong on 4/1/2561 BE.
//  Copyright © 2561 u21. All rights reserved.
//

import UIKit
import Firebase

class QuizViewController: UIViewController {
    
    var countdownTimer: Timer!
    var totalTime = 20
    var score = 0
    var arrQuiz: [QuizModel] = []
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var soluTrueBtn: UIButton!
    @IBOutlet weak var soluFalseBtn: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        
        
        arrQuiz = [
            QuizModel(question: "อาณาจักรล้านนาตั้งอยู่ในพื้นที่ภูเขาทางภาคเหนือของประเทศไทย ", solution: true),
            QuizModel(question: "พื้นที่ส่วนใหญ่เป็นพื้นที่ชายฝั่ง", solution: false),
            QuizModel(question: "สภาพแวดล้อมของพื้นที่ราบในแอ่งเขามีความอุดมสมบูรณ์ ", solution: true)
            
        ]
        
//        ,
//        QuizModel(question: "วิถีชีวิตเปลี่ยนแปลงตามสภาพแวดล้อมและพื้นที่ ", solution: true),
//        QuizModel(question: "ชุมชนบนพื้นที่ภูเขามีการตั้งถิ่นฐานขนาดใหญ่", solution: false),
//        QuizModel(question: "พื้นที่ภูเขาเป็นอุปสรรคในการตั้งถิ่นฐาน", solution: true),
//        QuizModel(question: "ประกอบอาชีตเกษตรกรรมเป็นหลัก", solution: true),
//        QuizModel(question: "ผู้คนใช้ภาษาในการสื่อสารเพียงภาษาเดียว ", solution: false),
//        QuizModel(question: "เกิดการเรียนรู้วิถีชีวิตของผู้คนในแต่ละพื้นที่", solution: true),
//        QuizModel(question: "การศึกษาความหลากหลายของผู้คนและพื้นที่ในอดีตทำให้เกิดการขยายโลกทัศน์ความรู้ ความเข้าใจให้แก่ผู้ศึกษามากขึ้น", solution: true)
        
        setQuiz(quiz: arrQuiz[0])
    }
    
    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        timerLabel.text = "\(timeFormatted(totalTime))"
        
        if totalTime != 0 {
            totalTime -= 1
        } else {
            endTimer()
        }
        
        if totalTime % 10 == 0 && totalTime >= 2 {
            checkAnswer()
            nextQuiz()
        }else if totalTime <= 1 {
            endTimer()
        }
        
    }
    
    var indexQuiz = 1
    
    func nextQuiz() {
        indexQuiz = indexQuiz + 1
        let quiz = arrQuiz[indexQuiz]
        setQuiz(quiz: quiz)
        
        
    }
    var solutionsGlobal = true
    
    func setQuiz(quiz: QuizModel) {
        questionLabel.text = quiz.question
        self.solutionsGlobal = quiz.solution
    }
    
    var userSolution = false
    @IBAction func truePressed() {
        userSolution = true
    }

    @IBAction func falsePressed() {
        userSolution = false
    }
    
    func saveScore() {
        guard let uuids = Auth.auth().currentUser?.uid else { return }
        
        let rawData = Database.database().reference().child("Users").child("\(uuids)/score")
        rawData.setValue(score)
        
    }
    
    func endTimer() {
        countdownTimer.invalidate()

        
        saveScore()
    
        let scoreBoard = LeaderBoardViewController()
        show(scoreBoard, sender: self)
        
    }
    
    func checkAnswer() {
        if solutionsGlobal == userSolution {
            score = score + 10
            resultLabel.text = "คุณตอบ: ถูกต้อง"
        }else {
            resultLabel.text = "คุณตอบ: ผิด"
        }
        
        scoreLabel.text = "Your Score: \(score)"
        
    }
    
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    
    
}
