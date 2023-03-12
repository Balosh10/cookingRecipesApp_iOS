//
//  Bundle+Extension.swift
//  CookingRecipesAppiOS
//
//  Created by osvaldo cespedes on 09/03/23.
//

import Foundation
import UIKit

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type,
                              from file: String,
                              dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
                              keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy

        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            var error = "Failed to decode \(file) from bundle"
            error = error.appending(" due to missing key '\(key.stringValue)'")
            error = error.appending(" not found – \(context.debugDescription)")
            fatalError(error)
        } catch DecodingError.typeMismatch(_, let context) {
            var error = "Failed to decode \(file) from bundle"
            error = error.appending(" bundle due to type mismatch – \(context.debugDescription)")
            fatalError(error)
        } catch DecodingError.valueNotFound(let type, let context) {
            var error = "Failed to decode \(file) from bundle"
            error = error.appending(" due to missing \(type) value – \(context.debugDescription)")
            fatalError(error)
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}
