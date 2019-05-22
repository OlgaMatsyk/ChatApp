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
        
        let textMessageBuilder = TextMessagePresenterBuilder(viewModelBuilder: TextBuilder(), interactionHandler: TextHandler())
        let photoMessageBuilder = PhotoMessagePresenterBuilder(viewModelBuilder: PhotoBuilder(), interactionHandler: PhotoHandler())

        return [TextModel.chatItemType : [textMessageBuilder],
                PhotoModel.chatItemType : [photoMessageBuilder]]
    }
    
    override func createChatInputView() -> UIView {
        let inputbar = ChatInputBar.loadNib()
        var appearance = ChatInputBarAppearance()
        appearance.sendButtonAppearance.title = "Send message"
        appearance.textInputAppearance.placeholderText = "Type a message..."
        self.presenter = BasicChatInputBarPresenter(chatInputBar: inputbar, chatInputItems: [handleSend(), handlePhoto()]
            , chatInputBarAppearance: appearance)
        
        return inputbar
    }
    
    func handleSend() -> TextChatInputItem{
        let item = TextChatInputItem()
        item.textInputHandler = {text in
            let date = Date()
            let double = date.timeIntervalSinceReferenceDate
            let senderId = "me"
            
            let message = MessageModel(uid: "\(senderId, double)", senderId: senderId, type: TextModel.chatItemType, isIncoming: false, date: date, status: .success)
            let textMessage = TextModel(messageModel: message, text: text)
            self.dataSource.addMessage(message: textMessage)

        }
        return item;
    }
    
    func handlePhoto() -> PhotosChatInputItem {
        let item = PhotosChatInputItem(presentingController: self)
        item.photoInputHandler = { (photo, source) in
            let date = Date()
            let double = date.timeIntervalSinceReferenceDate
            let senderId = "me"
            let message = MessageModel(uid: "\(senderId, double)", senderId: senderId, type: PhotoModel.chatItemType, isIncoming: false, date: date, status: .success)
            let photoMessage = PhotoModel(messageModel: message, imageSize: photo.size, image: photo)
            self.dataSource.addMessage(message: photoMessage)
        }
        
        return item
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = DataSource(totalMessages: totalMessages)
        self.chatDataSource = self.dataSource
        self.chatItemsDecorator = self.decorator
    }


}

