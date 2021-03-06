//
//  ConversationViewModel.swift
//  mcpttapp
//
//  Created by Hemanth Kumar H N on 09/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation
import UIKit

enum PTTState {
    case idleState
    case busyState
    
    // TODO: once we get images for ptt button state will modify this method or add new one
    var colorCode: UIColor {
        switch self {
        case .idleState:
           return UIColor.gray
        case .busyState:
           return UIColor.green
        }
    }
    
    var colorForSpeakingMode: UIColor {
        switch self {
        case .idleState:
            return UIColor.red
        case .busyState:
            return UIColor.yellow
        }
    }

}
public enum MessageKind {
    case text(String)
    case audio(String)
}

public enum MessageStatus {
    case success(Bool)
    case fail(Bool)
}
protocol MessageType {
    var sender: Sender { get }
    var messageId: String { get }
    var sentDate: Date { get }
    var kind: MessageKind { get }
}

struct Sender {
    public let id: String
    public let displayName: String
    public init(id: String, displayName: String) {
        self.id = id
        self.displayName = displayName
    }
}
struct ConversationModel: MessageType {
    var messageId: String
    var sender: Sender
    var sentDate: Date
    var kind: MessageKind
    var messageStatus: MessageStatus
    
    private init(kind: MessageKind, sender: Sender, messageId: String, date: Date, messageStatus: MessageStatus) {
        self.kind = kind
        self.sender = sender
        self.messageId = messageId
        self.sentDate = date
        self.messageStatus = messageStatus
    }
    init(text: String, sender: Sender, messageId: String, date: Date, messageStatus: Bool) {
        self.init(kind: .text(text), sender: sender, messageId: messageId, date: date, messageStatus: .success(messageStatus))
    }
    init(audioPath: String, sender: Sender, messageId: String, date: Date, messageStatus: Bool) {
        self.init(kind: .audio(audioPath), sender: sender, messageId: messageId, date: date, messageStatus: .success(messageStatus))
    }
}
