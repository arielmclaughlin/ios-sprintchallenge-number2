import UIKit

class OnboardingViewController: UIViewController {
    @IBAction func getStarted(_ sender: Any) {
        localNotificationHelper.requestAuthorization { (proceed) in
            if proceed {
                self.localNotificationHelper.scheduleDailyReminder()
                self.performSegue(withIdentifier: "Onboard", sender: nil)
            } else {
                return
            }
        }
        
        func requestAuthorization() {
    
        }
    }
    
    let localNotificationHelper = LocalNotificationHelper()
    
        override func viewDidLoad() {
        super.viewDidLoad()
            
            localNotificationHelper.getAuthorizationStatus { (status) in
                switch status {
                case .authorized:
                    self.performSegue(withIdentifier: "Onboard", sender: nil)
                default:
                    return
                }
            }
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    



}
