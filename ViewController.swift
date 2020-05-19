import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    
    let questions = [
        Question(q: "Today is Friday", a: true),
        Question(q: "Everyday is Friday", a: true),
        Question(q: "Tomorrow is Monday", a: false),
        Question(q: "Yesterday was Tuesday", a: false),
        Question(q: "Tomorrow is Friday", a: true)
    ]
    
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateProgressBar()
        updateUi()
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        var answer = false
        if(sender.currentTitle == "True") {
            answer = true
        }
        
        if(answer == questions[questionIndex].answer) {
            // correct answer
            sender.backgroundColor = UIColor.green
        } else {
            // wrong answer
            sender.backgroundColor = UIColor.red
        }
        
        if(questionIndex + 1 < questions.count) {
            questionIndex += 1
        } else {
            questionIndex = 0
        }
        
        updateProgressBar()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUi), userInfo:nil, repeats: false)
    }
    
    @objc func updateUi() {
        questionText.text = questions[questionIndex].question
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear
    }
    
    func updateProgressBar() {
        progressBar.progress = Float(questionIndex + 1) / Float(questions.count)
    }
    

}

