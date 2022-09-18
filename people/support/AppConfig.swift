//
//  AppConfig.swift
//  people
//
//  Created by Javier Martinez Zamorano on 11/9/22.
//

import Foundation
import Swinject

class AppConfig {
    static let shared = AppConfig()
    public var container: Container?
    
    private init() {}
    
    func getBaseUrl() -> String {
        return "https://hello-world.innocv.com"
    }
    
    public func configure() {
        container = ContainerFactory.make()
    }
}
