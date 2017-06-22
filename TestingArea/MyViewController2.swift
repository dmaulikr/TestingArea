import UIKit
import SwiftyUtils
import FirebaseAuth
import GoogleSignIn
import Eureka
import Alamofire
import RxSwift
import RxCocoa
import Instructions

class MyViewController2: UIViewController, GIDSignInUIDelegate, CoachMarksControllerDelegate, CoachMarksControllerDataSource {
    @IBOutlet var textfield: UITextField!
    @IBOutlet var textview: UITextView!
    @IBOutlet var button: UIButton!
    
    let disposeBag = DisposeBag()
    let cmController = CoachMarksController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cmController.dataSource = self
        cmController.delegate = self
        
        test3()
        test4()
    }
    
    func numberOfCoachMarks(for coachMarksController: CoachMarksController) -> Int {
        return 3
    }
    
    func coachMarksController(_ coachMarksController: CoachMarksController, coachMarkAt index: Int) -> CoachMark {
        return test6()
    }
    
    func test5(_ index: Int) -> CoachMark {
        switch index {
        case 0:
            return cmController.helper.makeCoachMark(for: textfield)
        case 1:
            return cmController.helper.makeCoachMark(for: textview)
        case 2:
            return cmController.helper.makeCoachMark(for: button)
        default:
            return cmController.helper.makeCoachMark()
        }
    }
    func test1() {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    func test2() {
        textfield.rx.text.orEmpty.throttle(0.3, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .bind(to: textview.rx.text).disposed(by: disposeBag)
    }
    
    func test3() {
        textfield.rx.text.orEmpty.throttle(0.3, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .map { $0.uppercased() }
            .bind(to: textview.rx.text).disposed(by: disposeBag)
    }
    
    func test4() {
        textfield.rx.text.orEmpty.throttle(0.3, scheduler: MainScheduler.instance)
            .asObservable()
            .subscribe(onNext: {
                text in
                self.button.setTitle(text.characters.count.description, for: .normal)
            }).disposed(by: disposeBag)
    }
        
    @IBAction func click() {
        
    }
}
