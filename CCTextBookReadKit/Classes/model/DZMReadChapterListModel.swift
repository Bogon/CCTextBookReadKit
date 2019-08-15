//
//  DZMReadChapterListModel.swift
//  DZMeBookRead
//
//  Created by dengzemiao on 2019/4/17.
//  Copyright © 2019年 DZM. All rights reserved.
//

import UIKit

public class DZMReadChapterListModel: NSObject,NSCoding {
    
    /// 章节ID
    @objc public var id:NSNumber!

    /// 小说ID
    public var bookID:String!
    
    /// 章节名称
    public var name:String!
    
    // MARK: -- NSCoding
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init()
        
        bookID = aDecoder.decodeObject(forKey: "bookID") as? String
        
        id = aDecoder.decodeObject(forKey: "id") as? NSNumber
        
        name = aDecoder.decodeObject(forKey: "name") as? String
    }
    
    public func encode(with aCoder: NSCoder) {
        
        aCoder.encode(bookID, forKey: "bookID")
        
        aCoder.encode(id, forKey: "id")
        
        aCoder.encode(name, forKey: "name")
    }
    
    init(_ dict:Any? = nil) {
        
        super.init()
        
        if dict != nil { setValuesForKeys(dict as! [String : Any]) }
    }
    
    override public func setValue(_ value: Any?, forUndefinedKey key: String) { }
}
