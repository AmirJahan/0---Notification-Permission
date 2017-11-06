
import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getUserPermission();
    }
    
    
    // how to re-authorize
    
    func getUserPermission()
    {
        // grant access by user to receve notifications
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: [.alert, .sound])
            {
                (accepted, error) in
                var alert : UIAlertController;
                
                
                if !accepted
                {
                    alert = UIAlertController(title: "Denied",
                                              message: "Notification access denied.",
                                              preferredStyle: UIAlertControllerStyle.alert);
                }
                else
                {
                    alert = UIAlertController(title: "Granted",
                                              message: "Notification access granted.",
                                              preferredStyle: UIAlertControllerStyle.alert);
                }
                alert.addAction(UIAlertAction(title: "Ok",
                                              style: UIAlertActionStyle.default,
                                              handler: nil))
                
                self.present(alert, animated: true, completion: nil)
        }
    }
    
}

