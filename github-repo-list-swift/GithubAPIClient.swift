//
//  FISGithubAPIClient.swift
//  github-repo-list-swift


import UIKit

class GithubAPIClient {
    typealias JSON = [String:Any]
    
    class func getRepositories(with completion:@escaping ([JSON])->Void) {
        
        let urlString = gitHubForPostMan
        
        let url = URL(string: urlString)
        
        guard let unwrappedUrl = url else{
            print("NO URL")
            return
        }
        
        let session = URLSession.shared
        let request = URLRequest(url: unwrappedUrl)
        let dataTask = session.dataTask(with: request) { (data, reponse, error) in
            
            guard let data = data else {
                return
            }
            
            let jsonArray : [JSON]
            
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
