import UIKit
import Photos

class MemoryDetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var memoryController = MemoryController()
    var memory: Memory?
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addPhoto(_ sender: Any) {
        
      }
    @IBAction func savePhoto(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    func updateViews() {
 //       guard let memory = memory else {
 //           if let title = "Add Memory" {
 //               else
 //           }
 //           return
 //       }

    
    

}
}
