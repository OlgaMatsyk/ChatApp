//
//  ViewController.swift
//  ChatApp
//
//  Created by Olga Matsyk on 5/19/19.
//  Copyright © 2019 Matsyk. All rights reserved.
//

import UIKit
import Chatto
import ChattoAdditions

class ChatLogController: BaseChatViewController {
    
    var presenter: BasicChatInputBarPresenter!
    var dataSource: DataSource!
    var decorator = Decorator()
    var totalMessages = [ChatItemProtocol]()
    
    override func createPresenterBuilders() -> [ChatItemType : [ChatItemPresenterBuilderProtocol]] {
        return [ChatItemType : [ChatItemPresenterBuilderProtocol]]()
    }
    
    override func createChatInputView() -> UIView {
        let inputbar = ChatInputBar.loadNib()
        var appearance = ChatInputBarAppearance()
        appearance.sendButtonAppearance.title = "Send message"
        appearance.textInputAppearance.placeholderText = "Type a message..."
        self.presenter = BasicChatInputBarPresenter(chatInputBar: inputbar, chatInputItems: [handleSend()]
            , chatInputBarAppearance: appearance)
        
        return inputbar
    }
    
    func handleSend() -> TextChatInputItem{
        let item = TextChatInputItem()
        item.textInputHandler = {text in
            print(text)
            let date = Date()
            let double = date.timeIntervalSinceReferenceDate
            let senderId = "me"
            
            let message = MessageModel(uid: "\(senderId, double)", senderId: senderId, type: TextModel.chatItemType, isIncoming: false, date: date, status: .success)
            let textMessage = TextModel(messageModel: message, text: text)
            self.dataSource.addMessage(message: textMessage)

        }
        return item;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...295 {
            totalMessages.append(TextModel(messageModel: MessageModel(uid: "\(i)", senderId: "\(i)", type: TextModel.chatItemType, isIncoming: false, date: Date(), status: .success), text: "\(i)"))
        }

        self.dataSource = DataSource(totalMessages: totalMessages)
        self.chatDataSource = self.dataSource
        self.chatItemsDecorator = self.decorator
    }


}

