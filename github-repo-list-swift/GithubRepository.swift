
import UIKit

class GithubRepository {
    
    var fullName : String?
    var htmlURL: URL?
    var repositoryID: String?
    
    init(dictionary:[String:Any]) {
        guard let name = dictionary["full_name"] else {return}
        guard let url = dictionary["html_url"] else {return}
        guard let repoID = dictionary["id"] else {return}
        
        self.fullName = name as? String
        self.htmlURL = URL(string: url as! String)!
        self.repositoryID = String(describing: repoID)
    }
}
