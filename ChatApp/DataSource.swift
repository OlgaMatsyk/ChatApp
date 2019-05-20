//
//  DataSource.swift
//  ChatApp
//
//  Created by Olga Matsyk on 5/20/19.
//  Copyright © 2019 Matsyk. All rights reserved.
//

import Foundation
import Chatto
import ChattoAdditions

class DataSource: ChatDataSourceProtocol {
    
    var delegate: ChatDataSourceDelegateProtocol?
    
    var controller = ChatItemsController()
    
    init(totalMessages: [ChatItemProtocol]) {
        self.controller.totalMessages = totalMessages
        self.controller.loadIntoItemsArray(messagedNeeded: min(totalMessages.count, 50))
    }
    
    var chatItems: [ChatItemProtocol] {
        return controller.items
    }
    
    var hasMoreNext: Bool {
        
        return false
    }
    
    var hasMorePrevious: Bool {
        return controller.totalMessages.count - controller.items.count > 0
    }
    
    func loadNext() {
        
    }
    
    func loadPrevious() {
        controller.loadPrevious()
        self.delegate?.chatDataSourceDidUpdate(self, updateType: .pagination)
    }
    
    func addMessage(message: ChatItemProtocol) {
        self.controller.insertItem(message: message)
        self.delegate?.chatDataSourceDidUpdate(self)
    }
    
    
    func adjustNumberOfMessages(preferredMaxCount: Int?, focusPosition: Double, completion: (Bool) -> Void) {
        
        if focusPosition > 0.9 {
            self.controller.adjustWindow()
            completion(true)
        } else {
            completion(false)
        }
        
    }
}
