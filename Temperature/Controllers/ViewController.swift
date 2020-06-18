//
//  ViewController.swift
//  Temperature
//
//  Created by Admin on 17.06.2020.
//  Copyright © 2020 Lezya Alexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var models = [EntryModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        let nib = UINib(nibName: "EntryTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomCell")
        
        let navItem = UIBarButtonItem(title: "Chart", style: .done, target: self, action: #selector(pushToDetailViewController))
        navigationItem.rightBarButtonItem = navItem
        
        var randomDates = [Date]()
        for _ in 0...10 {
            randomDates.append(makeRandomDate())
        }
        randomDates.sort()
        
        models = randomDates.map { EntryModel(date: makeFormattedDateString(from: $0),
                                              temperature: makeRandomTemperature()) }
    }
    
    @objc func pushToDetailViewController() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.currentsModels = models
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func makeRandomTemperature() -> String {
       return String((Double.random(in: 33.0...44.0) * 10).rounded() / 10)
    }
    
    private func makeFormattedDateString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        return dateFormatter.string(from: date)
    }
    
    private func makeRandomDate() -> Date {
        let date = Date(timeIntervalSince1970: TimeInterval.random(in: 5...99999999))
        return date
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! EntryTableViewCell
        cell.configure(with: models[indexPath.row])
        cell.cellDelegate = self
        return cell
    }
    
}

extension ViewController: CustomCellDelegate {
    
    func customCellTappedDelete(_ cell: EntryTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        models.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .right)
    }
    
}
