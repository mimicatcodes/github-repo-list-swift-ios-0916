
import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    var repositories: [GithubRepository] = []
    
    func getRepositories(handler:@escaping (Bool)->Void) {
        repositories.removeAll()
        GithubAPIClient.getRepositories { [unowned self] (repos) in
            for dictionary in repos {
            let newRepo = GithubRepository(dictionary: dictionary)
            self.repositories.append(newRepo)
            }
            if self.repositories.isEmpty {
            handler(false)
            } else {
            handler(true)
            }
        }
    }
    
}
