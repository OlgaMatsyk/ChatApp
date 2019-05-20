//
//  Decorator.swift
//  ChatApp
//
//  Created by Olga Matsyk on 5/20/19.
//  Copyright © 2019 Matsyk. All rights reserved.
//

import Foundation
import Chatto
import ChattoAdditions

class Decorator: ChatItemsDecoratorProtocol {
    
    func decorateItems(_ chatItems: [ChatItemProtocol]) -> [DecoratedChatItem] {
        
        var decoratedItems = [DecoratedChatItem]()
        
        for item in chatItems {
            let baseMessageDecorationAttributes = BaseMessageDecorationAttributes(canShowFailedIcon: false, isShowingTail: false, isShowingAvatar: false, isShowingSelectionIndicator: false, isSelected: false)
            
            let decoratedItem = DecoratedChatItem(chatItem: item, decorationAttributes: ChatItemDecorationAttributes(bottomMargin: 3, messageDecorationAttributes:baseMessageDecorationAttributes))
            decoratedItems.append(decoratedItem)
        }
        return decoratedItems
    }
}
