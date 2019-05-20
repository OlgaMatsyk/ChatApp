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
    
    override func createPresenterBuilders() -> [ChatItemType : [ChatItemPresenterBuilderProtocol]] {
        return [ChatItemType : [ChatItemPresenterBuilderProtocol]]()
    }
    var presenter: BasicChatInputBarPresenter!
    
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
        }
        return item;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

