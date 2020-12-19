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
    @IBOutlet weak var messageTextField: UITextField!
    
    @IBOutlet weak var textFieldViewHeight: NSLayoutConstraint!
    var messages:[Message] = [Message]()
    override func viewDidLoad() {
        super.viewDidLoad()
        initlization()
        // Do any additional setup after loading the view.
    }
    
    func initlization() {
        setDelegate()
        addGestureRecognizerToTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        getAllMessages()
    }
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func callAction(_ sender: Any) {
        
    }
    
    @IBAction func emojiAction(_ sender: Any) {
        
    }
    
    @IBAction func plusAction(_ sender: Any) {
        
    }
    func setDelegate() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        messageTextField.delegate = self
    }
    func addGestureRecognizerToTableView() {
        let g = UITapGestureRecognizer(target: self, action: #selector(stopEditing))
        chatTableView.addGestureRecognizer(g)
    }
    @objc func stopEditing(){
        messageTextField.endEditing(true)
    }
    func getAllMessages() {
        FFirestore.init().getMessages { (status, messages) in
            if status{
                self.messages = messages!
                self.chatTableView.reloadData()
            }
        }
    }
}

extension ChatViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row % 2 == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatSenderTableViewCell") as! ChatSenderTableViewCell
//            cell.message.text = "hhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahshahhssahsha"
//            cell.time.text = "10:12"
//            return cell
//
//        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatReceiverTableViewCell") as! ChatReceiverTableViewCell
        let message = messages[indexPath.row]
        print(message.text)
        cell.setData(messageText: message.text, messageTime: "\(message.hour):\(message.minutes)")
        return cell
    }
}

extension ChatViewController:UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            self.textFieldViewHeight.constant = 378
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        UIView.animate(withDuration: 0.2) {
            self.getAllMessages()
            self.textFieldViewHeight.constant = 60
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveToFirestore()
        return true
    }
    
    func saveToFirestore() {
        let date = Date()
        let calendar = Calendar.current
        let nanosecond = calendar.component(.nanosecond, from: date)
        let minutes = calendar.component(.minute, from: date)
        let hour = calendar.component(.hour, from: date)
        messageTextField.isEnabled = false
        FFirestore.init().saveMessage(hour: hour, minutes: minutes, nanosecond: nanosecond, text: messageTextField.text!) { (status) in
            if status{
                self.messageTextField.isEnabled = true
                self.messageTextField.text = ""
            }else{
                
            }
        }
    }
}
