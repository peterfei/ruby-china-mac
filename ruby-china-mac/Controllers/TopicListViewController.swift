//
//  TopicListViewController.swift
//  ruby-china-mac
//
//  Created by peterfei on 2016/12/9.
//  Copyright © 2016年 peterfei. All rights reserved.
//

import Cocoa
import Alamofire
import SwiftyJSON

class TopicListViewController: NSViewController {

    
    @IBOutlet weak var tableView: NSTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 90.0
        loadTopics()
        // Do view setup here.
    }
    fileprivate var topics = [TopicModel]()
    
    fileprivate func loadTopics(_ maxId: Int = 0) {
        loadTopicsfromapi(maxId, count: kPagesize) {
            [unowned self](response) in
            guard let array = response else {
                return
            }
            
            if maxId == 0 {
                self.topics = array
                for item in array.reversed() {
                    if !self.topics.contains(where: { (topic:TopicModel) -> Bool in
                        return true
//                        return topics.articleId == item.articleId
                    }) {
                        self.topics.insert(item, at: 0)
                    }
                }
            } else {
                self.topics.append(contentsOf: array)
            }
            self.tableView.reloadData()
        }
    }
    
    func loadTopicsfromapi(_ maxId: Int, count: Int, callback:@escaping ((_ topics:[TopicModel]?) -> Void)) {
        let url = "https://ruby-china.org/api/v3/topics.json"
        
        Alamofire.request(url).responseJSON { (response) in
            guard let json = response.result.value else {
                return callback(nil)
            }
            
            let result = JSON(json)
            
//            guard let _ = result["isSuc"].bool else {
//                return callback(nil)
//            }
            
            var topics:[TopicModel] = [TopicModel]()
            let items = result["topics"].arrayValue
            for item in items {
                let topic = TopicModel.mapping(item)
                topics.append(topic)
            }
            callback(topics)
        }
    }
}
extension TopicListViewController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return topics.count
    }
    
}

extension TopicListViewController: NSTableViewDelegate {
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        let tableView = notification.object as! NSTableView
        let index = tableView.selectedRow
        if index == -1 || index >= topics.count {
            return
        }
        tableView.deselectRow(index)
//        let topic = topics[index]
//        Utility.showWebViewController(topic.url, title: topic.title)
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if topics.count > 0 && topics.count - row < 3 {
            let lastTopic = topics.last!
            loadTopics(lastTopic.id)
        }
        let cell = tableView.make(withIdentifier: "TopicListCell", owner: tableView) as! TopicListCell
        let topic = topics[row]
        cell.configureCell(topic)
        return cell
    }
    
}
