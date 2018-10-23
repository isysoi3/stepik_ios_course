// Этот файл пуст не по ошибке. В этот раз вам необходимо самостоятельно импортировать необходимые модули и запустить проверку

import FirstCourseThirdTaskChecker

struct Stack: ArrayInitializable, StorageProtocol {
    
    var count: Int
    
    private var stack: [Int]
    
    init() {
        count = 0
        stack = []
    }
    
    init(array: [Int]) {
        count = array.count
        stack = array
    }
    
    mutating func push(_ element: Int) {
        count += 1
        stack.append(element)
    }
    
    mutating func pop() -> Int {
        count -= 1
        return stack.removeLast()
    }
    
}

struct Queue: ArrayInitializable, StorageProtocol {
    
    var count: Int
    
    private var queue: [Int]
    
    init() {
        count = 0
        queue = []
    }
    
    init(array: [Int]) {
        count = array.count
        queue = array
    }
    
    mutating func push(_ element: Int) {
        count += 1
        queue.append(element)
    }
    
    mutating func pop() -> Int {
        count -= 1
        return queue.removeFirst()
    }
    
}

extension User: JSONInitializable, JSONSerializable {
    public convenience init(JSON: String) {
        self.init()
        
        let data = JSON.data(using: .utf8)!
        let jsonArray = try! JSONSerialization.jsonObject(with: data, options : .allowFragments) as? Dictionary<String,String>
        self.email = jsonArray!["email"]!
        self.fullName = jsonArray!["fullName"]!
    }
    
    public func toJSON() -> String {
        return "{\"fullName\": \"\(fullName)\", \"email\": \"\(email)\"}"
    }
    
    
}

let checker = Checker()

checker.checkProtocols(stack: Stack(), queue: Queue())

checker.checkExtensions(userType: User.self)

//checker.checkInheritance(stack: <#T##ArrayInitializableStorage#>, queue: <#T##ArrayInitializableStorage#>)

