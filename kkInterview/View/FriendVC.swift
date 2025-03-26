//
//  ViewController.swift
//  kkInterview
//
//  Created by Apple on 2025/3/17.
//

import UIKit

class FriendVC: UIViewController {

    @IBOutlet weak var avatarImgView: UIImageView!
    
    @IBOutlet weak var invitingView: UIView!
    
    @IBOutlet weak var segmentView: UIView!
        
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var invitingViewHeight: NSLayoutConstraint!
    
    var invitingFriends: [String] = ["彭安亭", "施君凌", "趙君麟"]
    
    lazy var viewModel = {
        FriendViewModel()
    }()
    
    /// segment
    private lazy var segment: LineSegmentController = {
        let view = LineSegmentController(frame: .zero, buttonTitle: ["好友", "聊天"])
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    private lazy var badgeFriend: BadgeView = {
        let view = BadgeView(frame: .zero)
        view.text = "2 "
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var badgeChat: BadgeView = {
        let view = BadgeView(frame: .zero)
        view.text = "99+"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cardStackView: CardStackView = {
        let view = CardStackView(frame: .zero, friends: invitingFriends)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var friendCardView: FriendCardView = {
        let view: FriendCardView = UIView.fromNib()
        return view
    }()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        setView()
    }
    
    private func initViewModel() {
        Task {
            await viewModel.getFriendList()
        }
        
        viewModel.reloadTableView = { [unowned self] in
            DispatchQueue.main.async {                
                self.tableView.reloadData()
            }
            
            
        }
    }
    
    private func setView() {
        view.backgroundColor = ColorGuide.whiteTwo
        segmentView.addSubview(segment)
        invitingView.addSubview(cardStackView)
        [badgeFriend, badgeChat].forEach { segmentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            cardStackView.topAnchor.constraint(equalTo: invitingView.topAnchor, constant: .zero),
            cardStackView.bottomAnchor.constraint(equalTo: invitingView.bottomAnchor, constant: -20),
            cardStackView.leadingAnchor.constraint(equalTo: invitingView.leadingAnchor, constant: 30),
            cardStackView.trailingAnchor.constraint(equalTo: invitingView.trailingAnchor, constant: -30),
            segment.widthAnchor.constraint(equalToConstant: 100),
            segment.heightAnchor.constraint(equalToConstant: 28),
            segment.leadingAnchor.constraint(equalTo: segmentView.leadingAnchor, constant: 30),
            segment.bottomAnchor.constraint(equalTo: segmentView.bottomAnchor),
            badgeFriend.topAnchor.constraint(equalTo: segmentView.topAnchor, constant: 10),
            badgeFriend.leadingAnchor.constraint(equalTo: segmentView.leadingAnchor, constant: 70),
            badgeChat.topAnchor.constraint(equalTo: segmentView.topAnchor, constant: 10),
            badgeChat.leadingAnchor.constraint(equalTo: segmentView.leadingAnchor, constant: 120)
        ])
        
        invitingViewHeight.constant = CGFloat(invitingFriends.count * 80) + 20

        tableView.delegate = self
        tableView.dataSource = self
        
        let friendCell = UINib(nibName: "FriendCell", bundle: nil)
        tableView.register(friendCell, forCellReuseIdentifier: "FriendCell")
    }


}

// MARK: UITableViewDataSource
extension FriendVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendCell
        cell.viewModel = viewModel.friendList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

// MARK: LineSegmentControllerDelegate
extension FriendVC: LineSegmentControllerDelegate {
    func change(to index: Int) {
        print(index)
    }
    
    
}
