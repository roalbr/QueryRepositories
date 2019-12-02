//
//  ImageUtil.swift
//  QueryRepositories
//
//  Created by Rodrigo Albuquerque on 30/11/19.
//  Copyright © 2019 Rodrigo Albuquerque. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func downloaded(url: URL, contentMode: UIView.ContentMode = .scaleAspectFit) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
}
