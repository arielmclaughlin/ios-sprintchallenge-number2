import UIKit


class MemoryController {
    
    // MARK: - CRUD
    
    init(){
        loadFromPersistentStore()
    }
    
    // Setting the array to empty
    
    var memories: [Memory] = []
    
    //Create
    func createMemory(withName title: String, bodyText: String, imageData: Data) {
        let newMemory = Memory(title: title, bodyText: bodyText, imageData: imageData)
        memories.append(newMemory)
    }
    
    func updateMemory(memory: Memory, title: String, bodyText: String, imageData: Data) {
        guard let index = memories.index(of: memory) else {return}
        memories[index].title = title
        memories[index].bodyText = bodyText
        memories[index].imageData = imageData
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else {return}
        
        do {
            let encoder = PropertyListEncoder()
            
            let data = try encoder.encode(memories)
            
            try data.write(to: url)
        } catch {
            NSLog("Error saving memories data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fm = FileManager.default
        
        guard let url = persistentFileURL, fm.fileExists(atPath: url.path) else {return}
        
        do {
            
            let decoder = PropertyListDecoder ()
            
            let data = try Data(contentsOf: url)
            
            memories = try decoder.decode([Memory].self, from: data)
        } catch {
            NSLog("Error loading memories data: \(error)")
        }
    }
    
    private var persistentFileURL: URL? {
        let fm = FileManager.default
        guard let directory = fm.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        return directory.appendingPathComponent("memories.plist")
    }
}


