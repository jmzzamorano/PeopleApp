//
//  UserServiceFake.swift
//  people
//
//  Created by Javier Martinez Zamorano on 11/9/22.
//

import Foundation
import RxSwift

class UserServiceFake: UserRepository {
    var parser: UserJsonParser
    
    init(parser: UserJsonParser) {
        self.parser = parser
    }
    
    func requestUsers() -> Single<[User]> {
        let jsonString = buildListWithSeveralUsers()
        let users = parser.parse(json: jsonString)
        return Single.just(users).delay(.seconds(3), scheduler: MainScheduler.instance)
    }
    
    private func buildBadFormattedJson() -> String {
        return "{"
    }
    
    private func buildEmptyList() -> String {
        return "[]"
    }
    
    private func buildListWithOneUser() -> String {
        return "[{\"name\":\"Foo\",\"birthdate\":\"2016-09-15T19:34:00\",\"id\":6613}]";
    }
    
    private func buildListWithSeveralUsers() -> String {
        return "[{\"name\":\"Nombre_1\",\"birthdate\":\"2016-09-15T19:34:00\",\"id\":6613}," +
        "{\"name\":\"Nombre_2\",\"birthdate\":\"2016-09-15T19:34:00\",\"id\":6634}," +
        "{\"name\":\"Nombre_3\",\"birthdate\":\"1988-02-10T20:01:00\",\"id\":6635}," +
        "{\"name\":\"Nombre_4\",\"birthdate\":\"2022-09-07T20:25:43\",\"id\":6642}]"
    }
}
