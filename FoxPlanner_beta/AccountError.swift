//
//  AccountError.swift
//  FoxPlanner_beta
//
//  Created by leeseunghyun on 11/02/2019.
//  Copyright © 2019 Seunghyun Lee. All rights reserved.
//

import Foundation

enum AccountError: String, Error {
    case emptyEmail = "이메일을 입력하세요"
    case emptyPassword = "비밀번호를 입력하세요"
    
    case emptyName = "이름을 입력하세요"
    case emptyConfirmPassword = "비밀번호를 다시 한번 입력하세요"
    case unequalPassword = "비밀번호가 일치하지 않습니다"
    case invalidEmail = "이메일 형식이\n올바르지 않습니다"
    case invalidPassword = "비밀번호는 대문자,\n소문자, 숫자를 포함해\n8자리 이상이어야 합니다"
}
