//
//  TextModel.swift
//  ChatApp
//
//  Created by Olga Matsyk on 5/20/19.
//  Copyright © 2019 Matsyk. All rights reserved.
//

import Foundation
import Chatto
import ChattoAdditions

class TextModel: TextMessageModel<MessageModel> {
    static let chatItemType = "text"
    
    override init(messageModel: MessageModel, text: String) {
        super.init(messageModel: messageModel, text: text)
    }
}
