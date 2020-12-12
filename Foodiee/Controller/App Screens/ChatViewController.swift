//
//  ChatViewController.swift
//  Foodiee
//
//  Created by Hany Kh on 21/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    @IBOutlet weak var chatTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func callAction(_ sender: Any) {
        
    }
}

extension ChatViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatSenderTableViewCell") as! ChatSenderTableViewCell
            cell.message.text = "hhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahsha"
            cell.time.text = "10:12"
            return cell
            
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatReceiverTableViewCell") as! ChatReceiverTableViewCell
        cell.message.text = "hhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhsahshahhssahshahhssahshahhssahshahhssahshahhs"
        cell.time.text = "10:12"
        return cell
    }
}
