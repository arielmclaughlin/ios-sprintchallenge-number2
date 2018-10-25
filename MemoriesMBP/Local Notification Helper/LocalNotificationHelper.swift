import Foundation
import UserNotifications

class LocalNotificationHelper {
    func getAuthorizationStatus(completion: @escaping (UNAuthorizationStatus) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            DispatchQueue.main.async {
                completion(settings.authorizationStatus)
            }
        }
    }
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
            
            if let error = error { NSLog("Error requesting authorization status for local notifications: \(error)") }
            
            DispatchQueue.main.async {
                completion(success)
            }
        }
    }
    
    func scheduleDailyReminder() {
    
    let content = UNMutableNotificationContent()
    content.title = "Don't forget"
    content.body = "Claire is waiting at School!"
    
        var date = DateComponents()
        date.hour = 20
        date.minute = 00
    
    let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
    }
}


