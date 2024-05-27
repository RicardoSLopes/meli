//
//  UIImageViewExtension.swift
//  Meli
//
//  Created by Ricardo Santana on 13/05/24.
//

import UIKit

extension UIImageView {
    
    func loadImageFrom(url: String, completion: @escaping () -> Void) {
        
        guard let url = URL(string: url) else {
            completion()
            return
        }
        
        DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.image = image
                            completion()
                        }
                    } else {
                        DispatchQueue.main.async {
                            completion()
                        }
                    }
                }
            }
        
        //        let request = URLSession.shared.dataTask(with: url) { data, response, error in
        //
        //            if let error = error {
        //                print("Error Getting Image \(error.localizedDescription)")
        //            }
        //
        //            guard let data = data else { return }
        //
        //            DispatchQueue.main.async {
        //                self.image = UIImage(data: data)
        //            }
        //        }
        //        request.resume()
//    }
}
