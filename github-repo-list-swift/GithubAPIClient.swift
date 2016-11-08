
import UIKit

class GithubAPIClient {
    
    typealias JSON = [String:Any] // dictionary
    
    class func getRepositories(with completion:@escaping ([JSON])->Void) {
        // the job of this function is to fetch all the repos from the Github API, and pass that array of dictionaries on to its completion closure.
        
        let urlString = Github.gitHubRepoUrl
        
        let url = URL(string: urlString)
        
        guard let unwrappedUrl = url else{
            print("NO URL")
            return
        }
        
        let request = URLRequest(url: unwrappedUrl)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, reponse, error) in
            
            guard let data = data else {
                return
            }
            
            let jsonArray : [JSON] // array of dictionaries
            // error handling: do / try/ catch
            do {
                jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as! [JSON]
                completion(jsonArray)
            } catch {
                print("Errorrrrr")
                return
            }
    
        }
        dataTask.resume()
    }

}
