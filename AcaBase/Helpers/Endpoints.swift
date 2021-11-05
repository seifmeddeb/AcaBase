//
//  Endpoints.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 9/9/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation

let mainUrl = "http://vps800310.ovh.net"
let mainAPIUrl = "http://vps800310.ovh.net/api/"

// MARK: User URLs
let registerUrl = mainAPIUrl+"register"
let loginUrl = mainAPIUrl+"login_check"
let resetPasswordUrl = mainAPIUrl+"user/password/reset"
let userStatsUrl = mainAPIUrl+"user/profile"

// MARK: Main Page URLs
let trainersUrl = mainAPIUrl+"trainers"
let topicsUrl = mainAPIUrl+"subjects"
let homeQuizUrl = mainAPIUrl+"home/quiz"
let videosUrl = mainAPIUrl+"videos"
let trainerAddFavUrl = mainAPIUrl+"trainer/add/fav"
let trainerRemoveFavUrl = mainAPIUrl+"trainer/remove/fav"

// MARK: ASK URLs
let askUrl = mainAPIUrl+"user/ask"
let attachementsUrl = mainAPIUrl+"user/ask/attachements"


//MARK: Chapter with progress
func getChapterDetailsUrl( _ chapterId: Int) -> String { return "\(mainAPIUrl)chapters/\(chapterId)/structure" }

//MARK: Quiz Urls
let quizScoreUrl = mainAPIUrl+"quiz/score/register"


// MARK: Chat URLs
let attachementChatUrl = mainAPIUrl+"upload/new"

// MARK: Shop URL
let shopUrl = mainAPIUrl+"subscription"

// MARK: Payment URL
let paymentUrl = mainAPIUrl+"payment/process"

//MARK: EndSession Url
let endSessionUrl = mainAPIUrl+"ask/finish"
