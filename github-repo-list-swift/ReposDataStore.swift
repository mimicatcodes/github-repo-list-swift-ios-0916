
import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    
    var repositories: [GithubRepository] = []
    
    func getRepositoriesFromAPI(handler:@escaping (Bool)->Void) {
        repositories.removeAll()
        // the completion closure to the API client function should use the init(dictionary:) method on GithubRepository to turn the dictionaries you receive into repository objects.
        GithubAPIClient.getRepositories { [unowned self] (arrayOfRepos) in
            for dictionary in arrayOfRepos {
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

