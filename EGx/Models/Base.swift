//
//  Base.swift
//  EGx
//
//  Created by 少 on 2018/1/22.
//  Copyright © 2018年 少. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

protocol ModelEqutable: Equatable {
    var id: Int { get }
}

extension ModelEqutable {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}

class ProfileBaseModel: Mappable, ModelEqutable {
    var id: Int = 0
    var name: String = ""
    var avatarUrl: String = ""
    var webUrl: String = ""
    
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        avatarUrl <- map["avatar_url"]
        webUrl <- map["web_url"]
    }
}

class Group: ProfileBaseModel {
    
}

class Project: ProfileBaseModel {
    var fullName: String = ""
    
    override func mapping(map: Map) {
        fullName <- map["path_with_namespace"]
        super.mapping(map: map)
    }
}

class TaskBaseModel: Mappable, ModelEqutable {
    var id: Int = 0
    var iid: Int = 0
    var title: String = ""
    var description: String = ""
    var state: String = ""
    var webUrl: String = ""
    var notesCount: Int = 0
    var author: User!
    var assignee: User?
    var createdAt: Date!
    var updatedAt: Date?
    
    required init?(map: Map) {
        guard ((map.JSON["id"] as? Int) != nil) else {
            return nil
        }
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        iid <- map["iid"]
        title <- map["title"]
        description <- map["description"]
        state <- map["state"]
        webUrl <- map["web_url"]
        notesCount <- map["user_notes_count"]
        author <- map["author"]
        assignee <- map["assignee"]
        createdAt <- (map["created_at"], DateTransform())
        updatedAt <- (map["updated_at"], DateTransform())
    }
}

class Milestone: Mappable, ModelEqutable {
    var id: Int = 0
    var iid: Int!
    var title: String!
    var state: String = ""
    var projectId: Int = 0
    var groupId: Int = 0
    var dueDate: Date!
    var startDate: Date!
    var createdAt: Date!
    var updatedAt: Date!
    var webUrl: String!
    
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        iid <- map["iid"]
        title <- map["title"]
        projectId <- map["project_id"]
        groupId <- map["group_id"]
        dueDate <- (map["due_date"], DateTransform())
        startDate <- (map["start_date"], DateTransform())
        createdAt <- (map["created_at"], DateTransform())
        updatedAt <- (map["updated_at"], DateTransform())
        webUrl <- map["web_url"]
    }
}



class Issue: TaskBaseModel {
    var projectId: Int = 0
    var labels: [String] = []
    var milestone: Milestone!
    
    override func mapping(map: Map) {
        projectId <- map["project_id"]
        milestone <- map["milestone"]
        labels <- map["labels"]
        
        super.mapping(map: map)
    }
}

class MergeRequest: TaskBaseModel {
    var projectId: Int = 0
    var groupId: Int = 0
    var upvotes: Int = 0
    var downvotes: Int = 0
    var isWIP: Bool = false
    var targetBranch: String = ""
    var sourceBranch: String = ""
    
    override func mapping(map: Map) {
        projectId <- map["project_id"]
        groupId <- map["group_id"]
        upvotes <- map["upvotes"]
        downvotes <- map["downvotes"]
        isWIP <- map["work_in_progress"]
        targetBranch <- map["target_branch"]
        sourceBranch <- map["source_branch"]
        
        super.mapping(map: map)
    }
}

class ProjectLabel: Mappable {
    var id: Int = 0
    var name: String = ""
    var color: NSColor!
    var description: String = ""
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        color <- (map["color"], HexColorTransform())
        description <- map["description"]
    }
}

class Todo: Mappable {
    var id: Int = 0
    var actionName: String = ""
    var targetType: String = ""
    var body: String = ""
    var state: String = ""
    var targetUrl: String = ""
    var project: Project?
    var author: User?
    var targetIssue: Issue?
    var targetMR: MergeRequest?
    var createdAt: Date!
    
    var content: String {
        return (author?.name ?? "") + " \(actionName) at \(targetType)"
    }
    
    required init?(map: Map) {
        guard ((map.JSON["id"] as? Int) != nil) else {
            return nil
        }
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        actionName <- map["action_name"]
        targetType <- map["target_type"]
        body <- map["body"]
        state <- map["state"]
        targetUrl <- map["target_url"]
        author <- map["author"]
        project <- map["project"]
        createdAt <- (map["created_at"], DateTransform())
        targetIssue <- map["target"]
        targetMR <- map["target"]
    }
}
