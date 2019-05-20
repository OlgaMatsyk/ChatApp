//
//  ChatItemsController.swift
//  ChatApp
//
//  Created by Olga Matsyk on 5/20/19.
//  Copyright © 2019 Matsyk. All rights reserved.
//

import Foundation
import Chatto
import ChattoAdditions

class ChatItemsController {
    
    var totalMessages = [ChatItemProtocol]()
    var items = [ChatItemProtocol]()
    
    func loadIntoItemsArray(messagedNeeded: Int) {
        
        for index in stride(from: totalMessages.count - items.count, to: totalMessages.count - items.count - messagedNeeded, by: -1) {
            self.items.insert(totalMessages[index - 1], at: 0)
            
        }
    }
    
    
    func insertItem(message: ChatItemProtocol) {
        self.items.append(message)
        self.totalMessages.append(message)
    }
    
    func loadPrevious() {
        
        self.loadIntoItemsArray(messagedNeeded: min(totalMessages.count - items.count, 50))
        
    }
    
    func adjustWindow() {
        
        self.items.removeFirst(200)
        
    }
}
