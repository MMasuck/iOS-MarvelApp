//
//  EventsViewController.swift
//  MarvelApp
//
//  Created by Mariel Masuck on 28/09/2022.
//  Copyright © 2022 Mmasuck. All rights reserved.
//

import UIKit
import CryptoKit

class EventsViewController: UIViewController {

    var mManager = APIKey()
    let appearance = UINavigationBarAppearance()

    var events: [Event] = []

    @IBOutlet weak var eventsTableView: UITableView!
    // Having a tableView in the EventsViewController makes the app crash at runtime aswell as in Characters. Still have to find a way to fix this. Sorry!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Events"
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.hidesBackButton = true

        setupTable()
        fetchEvents()
    }

private func setupTable() {
    eventsTableView.delegate = self
    eventsTableView.dataSource = self
    eventsTableView.register(UINib(nibName: "EventCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
}

private func fetchEvents() {
    let ts = String(Date().timeIntervalSince1970)
    let hash = MD5(data: "\(ts)\(mManager.privateKey)\(mManager.publicKey)")
    let url = URL(string: "https://gateway.marvel.com:443/v1/public/events?&ts=\(ts)&apikey=\(mManager.publicKey)&hash=\(hash)")

    let task = URLSession.shared.dataTask(with: URLRequest(url: url!)) { data, _, error in
        if error != nil {
            print(String(describing: error))
            return
        }

        do {
            self.events = try JSONDecoder().decode([Event].self, from: data!)
            DispatchQueue.main.async {
                self.eventsTableView.reloadData()
            }
        }
        catch {
            print(String(describing: error))
        }
    }
    task.resume()
}

    func MD5(data: String) -> String {
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        return hash.map {
            String(format: "%02hhx", $0)
        } .joined()
    }
}


extension EventsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! EventCell
        cell.titleLabel.text = events[indexPath.row].title
        cell.cellImage.loadImage(with: "\(events[indexPath.row].thumbnail[0].path)/standard_large.\(events[indexPath.row].thumbnail[0].extension)")
        return cell
    }
}


extension EventsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
