//
//  WelcomeViewController.swift
//  Foodiee
//
//  Created by Hany Kh on 13/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit
class WelcomeViewController: UIViewController {
//    var mealController:MealController = MealController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

    @IBAction func loginAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func SignUpAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CreateProfileViewController") as! CreateProfileViewController
        navigationController?.pushViewController(vc, animated: true)
    }
//    func setDataForRealm(){
//
//        let meal = Meal()
//        meal.name = "asdjkfhds"
//        meal.BGimage = UIImage(named: "")!
//        meal.image = UIImage(named: "")!
//        meal.detailsAboutMeal = ""
//        meal.mealRate = 4.0
//        meal.calories = 5
//        meal.carbohydrates = 0
//        meal.Price = 25.0
//        meal.DateOfOrder = "Nov 10  8:32 am"
//        let reviewer1 = Reviews()
//        reviewer1.reviewerName = "hany alkahlout"
//        reviewer1.reviewerWords = "sdkalfjksldajflks;adjfla;skjflaskjf"
//
//        let reviewer2 = Reviews()
//        reviewer2.reviewerName = "hady alkahlout"
//        reviewer2.reviewerWords = "sdkalfjksldajflks;adjfla;skjflaskjf"
//
//
//        let reviewer3 = Reviews()
//        reviewer3.reviewerName = "huda alkahlout"
//        reviewer3.reviewerWords = "sdkalfjksldajflks;adjfla;skjflaskjf"
//
//
//        let reviewer4 = Reviews()
//        reviewer4.reviewerName = "Noor alkahlout"
//        reviewer4.reviewerWords = "sdkalfjksldajflks;adjfla;skjflaskjf"
//
//        let reviewer5 = Reviews()
//        reviewer5.reviewerName = "Nsreen alkahlout"
//        reviewer5.reviewerWords = "sdkalfjksldajflks;adjfla;skjflaskjf"
//
//        meal.reviews?.append(reviewer1)
//        meal.reviews?.append(reviewer2)
//        meal.reviews?.append(reviewer3)
//        meal.reviews?.append(reviewer4)
//        meal.reviews?.append(reviewer5)
//
//        mealController.create(meal: meal)
//
//
//    }
}
