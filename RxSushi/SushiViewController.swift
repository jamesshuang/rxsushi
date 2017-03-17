//
//  SushiViewController.swift
//  RxSushi
//
//  Created by James Huang on 3/13/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import UIKit
import RealmSwift
import RxSwift
import RxCocoa

class SushiViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = SushiViewModel()
    
    //create observable with all sushis
    let allSushi = Observable.just(Sushi.sushi)
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCells()
        setupTapHandling()
    }

    private func createCells() {
        allSushi.bindTo(tableView.rx.items(cellIdentifier: SushiCell.Identifier, cellType: SushiCell.self)) {
            row, sushi, cell in cell.configureSushi(sushi: sushi)
        }.addDisposableTo(disposeBag)
    }
    
    private func setupTapHandling() {
        tableView.rx.modelSelected(Sushi.self).subscribe(onNext: {
            sushi in
            
            self.performSegue(withIdentifier: "ShowSushiDetail", sender: sushi)
            
            if let selectedRowIndexPath = self.tableView.indexPathForSelectedRow {
                self.tableView.deselectRow(at: selectedRowIndexPath, animated: true)
            }
            
        }).addDisposableTo(disposeBag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSushiDetail" {
            let controller = segue.destination as! SushiDetailViewController
            controller.sushi = sender as! Sushi
        }
    }
    
}
