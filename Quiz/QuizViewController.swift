//
//  QuizViewController.swift
//  Quiz
//
//  Created by 高橋詩穂 on 2016/01/09.
//  Copyright © 2016年 Shiho Takahashi. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizArray = [AnyObject]()
    
    var correctAnswer: Int = 0
    
    @IBOutlet var quizTextView: UITextView!
    
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        var tmpArray = [AnyObject]()
        
        tmpArray.append(["8809=6  7111=0  2172=0  6666=4  5531=0 のとき、2581=?","2","5","6",1])
        tmpArray.append(["1=1  2=2  3=3  4=5  5=4 のとき、8=?","3","2","1",2])
        tmpArray.append(["S ? H D W M Y ？には何が入るか","M","D","H",1])
        tmpArray.append(["ある3人の天気予報士が以下のように言っている。A「私の予報は70％当たります」B「私の予報は50％当たります」C「私の予報は20％しか当たりません」　誰の予報を聞けば一番高い確率で予報がわかるか","A","B","C",3])
        tmpArray.append(["宿＋飯＝2　寒＋温＝7　苦＋苦＝12　人＋色＝20　のとき、転＋倒＝?","13","14","15",3])
        tmpArray.append(["時→期→灯→泉→楽→銀→?","層","増","憎",2])
        
        srand(UInt32(time(nil)))
        while (tmpArray.count > 0) {
            let index = Int(rand()) % tmpArray.count
            quizArray.append(tmpArray[index])
            tmpArray.removeAtIndex(index)
        }
        choiceQuiz()
        
        // Do any additional setup after loading the view.
    }
    
    func choiceQuiz() {
        quizTextView.text = String(quizArray[0][0])
        
        choiceButton1.setTitle((quizArray[0][1] as! String), forState: .Normal)
        choiceButton2.setTitle((quizArray[0][2] as! String), forState: .Normal)
        choiceButton3.setTitle((quizArray[0][3] as! String), forState: .Normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][4] as! Int == sender.tag {
            
            correctAnswer++
        }
        
        quizArray.removeAtIndex(0)
        
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegueWithIdentifier("toResultView", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResultView") {
            
            let resultView = segue.destinationViewController as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
