//
//  PhotoModel.swift
//  ChatApp
//
//  Created by Olga Matsyk on 5/22/19.
//  Copyright © 2019 Matsyk. All rights reserved.
//

import Foundation
import Chatto
import ChattoAdditions


class PhotoModel: PhotoMessageModel<MessageModel> {
    
    
    static let chatItemType = "photo"
    
    override init(messageModel: MessageModel, imageSize: CGSize, image: UIImage) {
        super.init(messageModel: messageModel, imageSize: imageSize, image: image)
    }
}
