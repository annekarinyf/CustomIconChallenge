//
//  AlertHelper.swift
//  CustomIconChallenge
//
//  Created by Anne Kariny Silva Freitas on 08/02/20.
//  Copyright © 2020 Anne Kariny Silva Freitas. All rights reserved.
//

import Foundation
import UIKit

struct AlertHelper {
    static func presentOKAlert(in view: UIViewController, title: String?, message: String?) {
        let alertContoller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("OK", comment: "Confirmation"), style: .default, handler: nil)
        alertContoller.addAction(okAction)
        
        view.present(alertContoller, animated: true, completion: nil)
    }
}
