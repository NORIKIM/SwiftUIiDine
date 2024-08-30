//
//  Helper.swift
//  iDine
//
//  Created by 인터웍스_맥북 on 8/30/24.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}

/*
 func load<T: Decodable>(_ filename: String) -> T {
     let data: Data
     
     guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
         fatalError("couldn't find \(filename) in main bundle")
     }
     
     do {
         data = try Data(contentsOf: file)
     } catch {
         fatalError("coulnd't load \(filename) form main bundle:\n\(error)")
     }
     
     do {
         let decoder = JSONDecoder()
         return try decoder.decode(T.self, from: data)
     } catch {
         fatalError("couldn't pare \(filename) as \(T.self):\n\(error)")
     }
 }

 */
