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
    
    override func createChatInputView() -> UIView {
        let inputbar = ChatInputBar.loadNib()
        return inputbar
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

