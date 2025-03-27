//
//  ViewController.swift
//  kkInterview
//
//  Created by Apple on 2025/3/17.
//

import UIKit

class FriendVC: UIViewController {

    @IBOutlet weak var avatarImgView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var invitingView: UIView!
    
    @IBOutlet weak var segmentView: UIView!
        
    @IBOutlet weak var searchBar: UISearchBar!
        
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var invitingViewHeight: NSLayoutConstraint!
    
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
        let view = CardStackView(frame: .zero, friends: [""])
        return view
    }()
    
    private lazy var friendCardView: FriendCardView = {
        let view: FriendCardView = UIView.fromNib()
        return view
    }()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        binding()
        setView()
    }
    
    private func initViewModel() {
        Task {
            await viewModel.getMan()
            await viewModel.getCombineFriendList()
            await viewModel.getInvitingFriendList()
        }
    }
    
    private func binding() {
        viewModel.man.bind({ [weak self] man in
            DispatchQueue.main.async {
                guard let man = man else { return }
                self?.nameLabel.text = man.name
                self?.idLabel.text = "KOKO ID：\(String(describing: man.kokoid))"
            }
        })
        
        viewModel.invitingFriendList.bind { [weak self] friendList in
            guard let self = self else { return }
            DispatchQueue.main.async {
                guard let friendList = friendList else { return }
                let width: Int = Int(self.invitingView.frame.width - 60)
                let height: Int = friendList.count * 80
                let view = CardStackView(frame: CGRect(x: 30, y: .zero, width: width, height: height), friends: friendList)
                self.cardStackView = view
                self.invitingViewHeight.constant = CGFloat(friendList.count * 80) + 20
                self.invitingView.addSubview(self.cardStackView)
            }
        }
        
//        viewModel.combineFriendList.bind { [weak self] frindList in
//            DispatchQueue.main.async {
//                self?.tableView.reloadData()
//            }
//        }
        
        
        viewModel.friendViewList.bind { [weak self] friendList in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func setView() {
        view.backgroundColor = ColorGuide.whiteTwo
        segmentView.addSubview(segment)
        [badgeFriend, badgeChat].forEach { segmentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            segment.widthAnchor.constraint(equalToConstant: 100),
            segment.heightAnchor.constraint(equalToConstant: 28),
            segment.leadingAnchor.constraint(equalTo: segmentView.leadingAnchor, constant: 30),
            segment.bottomAnchor.constraint(equalTo: segmentView.bottomAnchor),
            badgeFriend.topAnchor.constraint(equalTo: segmentView.topAnchor, constant: 10),
            badgeFriend.leadingAnchor.constraint(equalTo: segmentView.leadingAnchor, constant: 70),
            badgeChat.topAnchor.constraint(equalTo: segmentView.topAnchor, constant: 10),
            badgeChat.leadingAnchor.constraint(equalTo: segmentView.leadingAnchor, constant: 120),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])
                
        tableView.delegate = self
        tableView.dataSource = self
        
        let friendCell = UINib(nibName: "FriendCell", bundle: nil)
        tableView.register(friendCell, forCellReuseIdentifier: "FriendCell")
        
        searchBar.delegate = self
        searchBar.setImage(UIImage(named: "icSearchBarSearchGray"), for: .search, state: .normal)
        // 設定backgroundImage 可讓背景兩條線消失
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.font = .systemFont(ofSize: 14)
        searchBar.searchTextField.layer.cornerRadius = 10
        searchBar.searchTextField.layer.masksToBounds = true
    }


}

// MARK: UITableViewDataSource
extension FriendVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.friendViewList.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendCell
        cell.viewModel = viewModel.friendViewList.value![indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

// MARK: UISearchBarDelegate
extension FriendVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        viewModel.filterFriend(searchText: searchText)
    }
}

// MARK: LineSegmentControllerDelegate
extension FriendVC: LineSegmentControllerDelegate {
    func change(to index: Int) {
        print(index)
    }
    
    
}
