import UIKit
import SwiftyUtils
import SwiftyJSON
import Alamofire
import FTPopOverMenu_Swift
import Eureka
import FirebaseAuth
import FirebaseStorage
import GoogleSignIn

public struct MyOptions: OptionSet {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let one = MyOptions(rawValue: 1 << 0)
    public static let two = MyOptions(rawValue: 1 << 1)
}

class MyViewController2: UIViewController, GIDSignInUIDelegate {
    @IBOutlet var textfield: UITextField!
    @IBOutlet var textview: UITextView!
    @IBOutlet var button: UIButton!
    
    var storage: FIRStorageReference!
    
    override func viewDidLoad() {
        storage = FIRStorage.storage().reference(forURL: storageURL)
        test1()
        test2()
    }
    
    func test1() {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    func test2() {
        let uploadRef = storage.child("images/settings.png")
        let data = UIImagePNGRepresentation(#imageLiteral(resourceName: "settings"))
        _ = uploadRef.put(data!, metadata: nil, completion: { (_, error) in
            if error != nil {
                print(error!)
            } else {
                print("Upload successful!")
            }
        })
    }
    
    @IBAction func click() {
        GIDSignIn.sharedInstance().signOut()
        try? FIRAuth.auth()?.signOut()
    }
}
