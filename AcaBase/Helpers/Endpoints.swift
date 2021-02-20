//
//  Endpoints.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 9/9/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation

let mainUrl = "http://vps800310.ovh.net/api/"

// MARK: User URLs
let registerUrl = mainUrl+"register"
let loginUrl = mainUrl+"login_check"
let resetPasswordUrl = mainUrl+"user/password/reset"


// MARK: Main Page URLs
let trainersUrl = mainUrl+"trainers"
let topicsUrl = mainUrl+"subjects"
let homeQuizUrl = mainUrl+"home/quiz"
let videosUrl = mainUrl+"videos"
let trainerFavUrl = mainUrl+"trainer/add/fav"

// MARK: ASK URLs
let askUrl = mainUrl+"user/ask"
let attachementsUrl = mainUrl+"quiz/score/register"


//MARK: Chapter with progress
func getChapterDetailsUrl( _ chapterId: Int) -> String { return "\(mainUrl)chapters/\(chapterId)/structure" }

//MARK: Quiz Urls
let quizScoreUrl = mainUrl+"quiz/score/register"
