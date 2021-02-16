//
//  AdminVC.swift
//  Restored Glory Christian Center
//
//  Created by Apple on 08/02/21.
//

import UIKit

class AdminVC: UIViewController {

    @IBOutlet weak var adminTBView: UITableView!
    var iconImgArray = ["send-push","links"]
    var titleArray = ["Send Puah","Links"]
    override func viewDidLoad() {
        super.viewDidLoad()
        adminTBView.separatorStyle = .none

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
class AdminTBViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var iconImg: UIImageView!
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension AdminVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iconImgArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdminTBViewCell", for: indexPath) as! AdminTBViewCell
        cell.iconImg.image = UIImage(named: iconImgArray[indexPath.row])
        cell.titleLbl.text = titleArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            
            let vc = PushMessageVC.instantiate(fromAppStoryboard: .Main)
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else if indexPath.row == 1{
            
            let vc = AddLinkVC.instantiate(fromAppStoryboard: .Main)
            UserDefaults.standard.set(true, forKey: "comesFromAdminLinks")
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
