//
//  API.swift
//  Planet Beach
//
//  Created by Ari Yamashita on 12/8/24.
//
import SwiftUI
import Foundation
import UIKit
import CommonCrypto

struct Signup: Codable {
    let accessToken: String
}

struct Login: Codable {
    let accessToken: String
}

struct Token: Codable {
    let isValid: String
}

struct Camera: Codable {
    let reward: Int
}

struct Trash: Codable {
    let trash: String
}


class SignupApi {
    var signupUrl = URL(string: "")
    var signupUrlOpt = URL(string: "https://verbose-happiness-q7v65xqrqg5qc47jj-3000.app.github.dev/signup")
    var signupUrlTest = URL(string: "https://v2.jokeapi.dev/joke/Programming")
    
     var parseError = "no error"
    
    
    func getSignup(password: String, email: String, completion:@escaping (String, String) -> ()) {
        if let signupUrl = URL(string: "https://verbose-happiness-q7v65xqrqg5qc47jj-3000.app.github.dev" + "/signup") {
            
            var request = URLRequest(url: signupUrl)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            // Create JSON body
            let json: [String: Any] = [
                "email": email,
                "password": password
            ]
            
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: json)
                request.httpBody = jsonData
            } catch {
                print("Error serializing JSON: \(error)")
                completion("Failed to serialize JSON", "error")
                return
            }
            
            let urlSession = URLSession(configuration: .default).dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error making POST request: \(error)")
                    completion("There was an error with the server. Please try again later.", "error")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    print("Invalid response object")
                    completion("There was an error with the server. Please try again later.", "error")
                    return
                }
                
                if httpResponse.statusCode != 200 {
                    print("HTTP Error: \(httpResponse.statusCode)")
                    completion("There was an error with the server. Please try again later.", "error")
                    return
                }
                
                guard let data = data else {
                    print("No data returned from server")
                    completion("There was an error with the server. Please try again later.", "error")
                    return
                }
                
//                if let jsonString = String(data: data, encoding: .utf8) {
//                        print("Raw JSON response: \(jsonString)")
//                    }
                
                do {
                    let signup = try JSONDecoder().decode(Signup.self, from: data)
                    let token = signup.accessToken
             
                    
                    DispatchQueue.main.async {
                        self.parseError = "no error"
                        completion(token, self.parseError)
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion("Failed to decode server response.", "error")
                }
            }
            
            urlSession.resume()
        }
    }


}


class LoginApi {
    var loginUrl = URL(string: "")
    var loginUrlOpt = URL(string: "https://verbose-happiness-q7v65xqrqg5qc47jj-3000.app.github.dev/signin")
    var loginUrlTest = URL(string: "https://v2.jokeapi.dev/joke/Programming")
    
     var parseError = "no error"
    
    
    func getLogin(password: String, email: String, completion:@escaping (String, String) -> ()) {
        if let loginUrl = URL(string: "https://verbose-happiness-q7v65xqrqg5qc47jj-3000.app.github.dev" + "/signin") {
            
            var request = URLRequest(url: loginUrl)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            // Create JSON body
            let json: [String: Any] = [
                "email": email,
                "password": password
            ]
            
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: json)
                request.httpBody = jsonData
            } catch {
                print("Error serializing JSON: \(error)")
                completion("Failed to serialize JSON", "error")
                return
            }
            
            let urlSession = URLSession(configuration: .default).dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error making POST request: \(error)")
                    completion("There was an error with the server. Please try again later.", "error")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    print("Invalid response object")
                    completion("There was an error with the server. Please try again later.", "error")
                    return
                }
                
                if httpResponse.statusCode != 200 {
                    print("HTTP Error: \(httpResponse.statusCode)")
                    completion("There was an error with the server. Please try again later.", "error")
                    return
                }
                
                guard let data = data else {
                    print("No data returned from server")
                    completion("There was an error with the server. Please try again later.", "error")
                    return
                }
                
//                if let jsonString = String(data: data, encoding: .utf8) {
//                        print("Raw JSON response: \(jsonString)")
//                    }
                
                do {
                    let login = try JSONDecoder().decode(Login.self, from: data)
                    let token = login.accessToken
             
                    
                    DispatchQueue.main.async {
                        self.parseError = "no error"
                        completion(token, self.parseError)
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion("Failed to decode server response.", "error")
                }
            }
            
            urlSession.resume()
        }
    }


}


class TokenApi {
    var tokenUrl = URL(string: "")
    var tokenUrlOpt = URL(string: "https://verbose-happiness-q7v65xqrqg5qc47jj-3000.app.github.dev/validate")
    var tokenUrlTest = URL(string: "https://v2.jokeapi.dev/joke/Programming")
    
     var parseError = "no error"
    
    
    func getToken(token: String, completion:@escaping (String, String) -> ()) {
        if let tokenUrl = URL(string: "https://verbose-happiness-q7v65xqrqg5qc47jj-3000.app.github.dev" + "/validate") {
            
            var request = URLRequest(url: tokenUrl)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            // Create JSON body
            let json: [String: Any] = [
                "accessToken": token
            ]
            
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: json)
                request.httpBody = jsonData
            } catch {
                print("Error serializing JSON: \(error)")
                completion("Failed to serialize JSON", "error")
                return
            }
            
            let urlSession = URLSession(configuration: .default).dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error making POST request: \(error)")
                    completion("There was an error with the server. Please try again later.", "error")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    print("Invalid response object")
                    completion("There was an error with the server. Please try again later.", "error")
                    return
                }
                
                if httpResponse.statusCode != 200 {
                    print("HTTP Error: \(httpResponse.statusCode)")
                    completion("There was an error with the server. Please try again later.", "error")
                    return
                }
                
                guard let data = data else {
                    print("No data returned from server")
                    completion("There was an error with the server. Please try again later.", "error")
                    return
                }
                
//                if let jsonString = String(data: data, encoding: .utf8) {
//                        print("Raw JSON response: \(jsonString)")
//                    }
                
                do {
                    let token = try JSONDecoder().decode(Token.self, from: data)
                    let isValid = token.isValid
             
                    
                    DispatchQueue.main.async {
                        self.parseError = "no error"
                        completion(isValid, self.parseError)
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion("Failed to decode server response.", "error")
                }
            }
            
            urlSession.resume()
        }
    }


}


class CameraApi {
    var cameraUrl = URL(string: "")
    var cameraUrlOpt = URL(string: "https://verbose-happiness-q7v65xqrqg5qc47jj-3000.app.github.dev/validate")
    var cameraUrlTest = URL(string: "https://v2.jokeapi.dev/joke/Programming")
    
     var parseError = "no error"

    func convertImageToBase64String(_ image: UIImage?, compressionQuality: CGFloat = 1.0) -> String? {
        // Ensure the compression quality is within valid bounds
        guard (0.0...1.0).contains(compressionQuality) else {
            print("Error: Compression quality must be between 0.0 and 1.0.")
            return nil
        }

        // Convert the UIImage to JPEG data
        guard let imageData = image?.jpegData(compressionQuality: compressionQuality) else {
            print("Error: Failed to convert UIImage to JPEG data.")
            return nil
        }

        // Encode the image data to a Base64 string
        let base64String = imageData.base64EncodedString(options: .lineLength64Characters)
        print(base64String)
        return base64String
    }

    
    func compressImage(_ image: UIImage, compressionQuality: CGFloat) -> Data? {
        return image.jpegData(compressionQuality: compressionQuality)
    }
    
    func getCamera(image: UIImage?, completion:@escaping (Int, String) -> ()) {
        if let cameraUrl = URL(string: "https://verbose-happiness-q7v65xqrqg5qc47jj-3000.app.github.dev" + "/ai/trash") {
            
            var request = URLRequest(url: cameraUrl)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            // Create JSON body
            let json: [String: Any] = [
                "image": convertImageToBase64String(image ?? nil, compressionQuality: 0.5) ?? ""
            ]
            
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: json)
                request.httpBody = jsonData
            } catch {
                print("Error serializing JSON: \(error)")
                completion(0, "error")
                return
            }
            
            let urlSession = URLSession(configuration: .default).dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error making POST request: \(error)")
                    completion(0, "error")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    print("Invalid response object")
                    completion(0, "error")
                    return
                }
                
                if httpResponse.statusCode != 200 {
                    print("HTTP Error: \(httpResponse.statusCode)")
                    completion(0, "error")
                    return
                }
                
                guard let data = data else {
                    print("No data returned from server")
                    completion(0, "error")
                    return
                }
                
//                if let jsonString = String(data: data, encoding: .utf8) {
//                        print("Raw JSON response: \(jsonString)")
//                    }
                
                do {
                    let camera = try JSONDecoder().decode(Camera.self, from: data)
                    let reward = camera.reward
             
                    
                    DispatchQueue.main.async {
                        self.parseError = "no error"
                        completion(reward, self.parseError)
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion(0, "error")
                }
            }
            
            urlSession.resume()
        }
    }


}



class TrashApi {
    let apiKey = "cc2a98dbf82de6bd84bb767a224c6b75"
    
    var newsUrl = URL(string: "")
    var newsUrlOpt = URL(string: "https://verbose-happiness-q7v65xqrqg5qc47jj-3000.app.github.dev")
    var newsUrlTest = URL(string: "https://v2.jokeapi.dev/joke/Programming")
    
     var parseError = "no error"
    
    
    func getNewsArticle(completion:@escaping (String, String) -> ()) {
        
        if let newsUrl = URL(string: "https://verbose-happiness-q7v65xqrqg5qc47jj-3000.app.github.dev/api/trash") {
            
            
                let urlSession = URLSession(configuration: .default).dataTask(with: newsUrl) { (data, response, error) in
                    if let error = error {
                        print(error)
                    }
                    
                    if let data = data {
                        print(data)
                        if let news = try? JSONDecoder().decode(Trash.self, from: data) {
                            let newsArticles = news.trash
                            
                            
                            DispatchQueue.main.async {
                                
                                
                                
                                self.parseError = "no error"
                                completion(newsArticles, self.parseError)
                                
                            }
                        }
                        else {
                            
                                print("Error: Server offline")
                                self.parseError = "error"
                            completion("", self.parseError)
                            
                        }
                        
                    }
                    
                    // we're OK to parse!
                    //                   URLSession.shared.dataTask(with: newsUrl) { data,_,_  in
                    
                    
                    //                    }
                    //                    else {
                    //                        print("Error: Could not parse")
                    //                    }
                    
                }
            
                urlSession.resume()
            
//                do {
//                    let news = try JSONDecoder().decode(News.self, from: data!)
//
//                    DispatchQueue.main.async {
//                        completion(news)
//                    }
//                } catch {
//                    print("Error: Article not found")
//                }
            
            
        }
        
    }
}



