//
//  API.h
//  YummlyDemoApp
//
//  Created by Macbook on 11/16/17.
//  Copyright © 2017 VDPersonal. All rights reserved.
//

#ifndef API_h
#define API_h

typedef enum {
    METHOD_POST = 0,
    METHOD_GET
} METHOD_TYPE;

// NEW and HOT
#define ID @"client_id=XSGYiNkhWe60LlcYKwdw"

// NEWURL + ID + DEEPHOUSE + ID
#define NEWURL @"https://api-v2.soundcloud.com/charts?kind=trending&genre=soundcloud%3Agenres%3A"
#define TOPURL @"https://api-v2.soundcloud.com/charts?kind=top&genre=soundcloud%3Agenres%3A"

#define ALLURL @"all-music&"
#define DEEPHOUSE @"deephouse&"
#define COUNTRYURL @"country&"
#define CLASSURL @"classical&"
#define DANCEURL @"dancehall&"
#define DISCOURL @"disco&"
#define ROCKURL @"rock&"
#define POPURL @"pop&"
#define TRAPURL @"trap&"
#define COMEDYURL @"comedy&"
#define SPORTURL @"sports&"
#define WORLDURL @"world&"


// SEARCHTRACKURL + ID
#define SEARCHTRACKURL @"https://api.soundcloud.com/tracks.json?q=Home&"
#define PLAYLISTURL @"http://api.soundcloud.com/playlists?"
#define GETTRACKURL @"http://api.soundcloud.com/tracks/358364042?"

// GOOGLE SEARCH API + KEY SEARCH
#define GOOGLESEARCHURL @"http://suggestqueries.google.com/complete/search?client=chrome&q="














#define URL1 @"http://admin.minimomentsapp.com//FileUpload/Background/Background_Unicorn_Announcement_20174107A074159.696610.png"
#define URL2 @"http://minimoment.saigontechnology.vn//FileUpload/Background/Background_Coastal_Announcement_20175513A105511.745715.png"
#define URL3 @"http://file.vforum.vn/hinh/2016/08/hinh-anh-mon-ngon-pizza-2.jpg"
#define URL4 @"http://bepvang.org.vn/Userfiles/Upload/images/Download/2017/2/24/51b2133d3c3f4855ac9e64f244d29138.jpg"
#define URL5 @"http://admin.doisong.vn/upload/2016/09/02/mon-ngon-cho-ngay-2-9.jpg%206.JPG"
#define URL6 @"https://mamcomviet.com/wp-content/uploads/2017/07/hinh-anh-nhung-mon-an-ngon-3.jpg"
#define URL7 @"http://a9.vietbao.vn/images/vi955/2011/10/55409788-1317784925-cao-lau.jpg"
#define URL8 @"http://anh.eva.vn/upload/1-2014/images/2014-03-31/1396251286-dsc04149a.jpg"
#define URL9 @"https://znews-photo-td.zadn.vn/w1024/Uploaded/jaroin/2017_01_05/banh_duc_nong__le_hong_quynh_1.jpg"
#define URL10 @"https://media.cooky.vn/images/blog-2016/3-mon-chinh-ngon-sieu-hap-dan-cho-ngay-tet-duong-lich-hinh-anh-1.jpg"
#define URL11 @"http://img.news.zing.vn/img/679/t679888.jpg"
#define URL12 @"http://static6.businessinsider.com/image/51c2254ceab8eac92600000e-1200/taste-the-best-sushi-in-the-world-at-sukiyabashi-jiro-the-famed-sushi-restaurant-from-the-documentary-jiro-dreams-of-sushi-go-soon-before-jiro-retires.jpg"
#define URL13 @"http://images.vov.vn/h500/uploaded/ja7idye43pa/2017_05_08/mon_ngon_tu_thit_lon_3_BIQZ.jpg"
#define URL14 @"https://baomoi-photo-1-td.zadn.vn/16/12/05/139/21005013/9_165358.jpg"
#define URL15 @"http://gl.amthuc365.vn/uploads/thumbs/News-thumb/500-379-mon-ngon-cua-gioi-tre-tp-hcm-ben-ho-con-rua-0796.jpg"
#define URL16 @"https://images.khoeplus24h.vn/zoom/470/uploaded/dinhtai/2017_10_19/troi-lanh-roi-lam-ngay-nhung-mon-ngon-quen-sau-nay-thoi-hinh-5.png"
#define URL17 @"https://znews-photo-td.zadn.vn/w1024/Uploaded/wyhktpu/2017_07_18/Com_Lanh_Canh_Ngot_5.jpg"
#define URL18 @"http://media.phunutoday.vn/files/upload_images/2015/06/17/mon-ngon-tu-qua-sau-6.jpg"
#define URL19 @"http://a9.vietbao.vn/images/vn999/150/2015/02/20150227-diem-danh-mon-nhat-ngon-duoc-yeu-thich-tai-ha-noi-3.jpg"
#define URL20 @"https://lavenderstudio.com.vn/wp-content/uploads/2017/09/chup-hinh-mon-an-2-copy.jpg"

#define ID1 @"1"
#define ID2 @"2"
#define ID3 @"3"
#define ID4 @"4"
#define ID5 @"5"
#define ID6 @"6"
#define ID7 @"7"
#define ID8 @"8"
#define ID9 @"9"
#define ID10 @"10"
#define ID11 @"11"
#define ID12 @"12"
#define ID13 @"13"
#define ID14 @"14"
#define ID15 @"15"
#define ID16 @"16"
#define ID17 @"17"
#define ID18 @"18"
#define ID19 @"19"
#define ID20 @"20"

#define DC1 @"Crispy, rice-batter"
#define DC2 @"The potato chip was born"
#define DC3 @"The sea is lapping just by your feet"
#define DC4 @"Thailand's most famous salad"
#define DC5 @"The national dish of Singapore"
#define DC6 @"French fries smothered in cheese curds"
#define DC7 @"A fresh, handmade tortilla stuffed"
#define DC8 @"Buttered is probably going to taste great"
#define DC9 @"Southeast Asia's most iconic foods"
#define DC10 @"The wrapper on bar number two"
#define DC11 @"Malcolm Gladwell says it's a perfect food"
#define DC12 @"Hong Kong-style French toas"
#define DC13 @"Parmesan and mozzarella cheese"
#define DC14 @"Chickpeas, garlic, lemon juice"
#define DC15 @"Singapore without trying its spicy, sloppy"
#define DC16 @"Canada's gift to parents everywhere"
#define DC17 @"Since the 1860s can't be doing much wrong"
#define DC18 @"The best foods in Japan"
#define DC19 @"paper-thin slices of air-dried"
#define DC20 @"This snack made from pork, shrimp, herbs"

#define NAME1 @"Buttered popcorn, United States"
#define NAME2 @"Masala dosa, India"
#define NAME3 @"Potato chips, United Kingdom"
#define NAME4 @"Seafood paella, Spain"
#define NAME5 @"Som tam, Thailand"
#define NAME6 @"Chicken rice, Singapore"
#define NAME7 @"Poutine, Canada"
#define NAME8 @"Tacos, Mexico"
#define NAME9 @"Buttered toast with Marmite, UK"
#define NAME10 @"Stinky tofu, Southeast Asia"
#define NAME11 @"Marzipan, Germany"
#define NAME12 @"Ketchup, United States"
#define NAME13 @"French toast, Hong Kong"
#define NAME14 @"Chicken parm, Australia"
#define NAME15 @"Hummus, Middle East"
#define NAME16 @"Chili crab, Singapore"
#define NAME17 @"Maple syrup, Canada"
#define NAME18 @"Fish chips, UK"
#define NAME19 @"Ankimo, Japan"
#define NAME20 @"Ankimo, Japan"

#define PRICE1 @"3.5k"
#define PRICE2 @"4.5k"
#define PRICE3 @"5.5k"
#define PRICE4 @"6.5k"
#define PRICE5 @"7.5k"
#define PRICE6 @"8.5k"
#define PRICE7 @"10.5k"
#define PRICE8 @"40.5k"
#define PRICE9 @"66.5k"
#define PRICE10 @"88.5k"
#define PRICE11 @"99.5k"
#define PRICE12 @"22.5k"
#define PRICE13 @"11.5k"
#define PRICE14 @"44.5k"
#define PRICE15 @"2.5k"
#define PRICE16 @"1.5k"
#define PRICE17 @"99.5k"
#define PRICE18 @"66.5k"
#define PRICE19 @"22.5k"
#define PRICE20 @"14.5k"

#define TITLE1 @"Buttered popcorn"
#define TITLE2 @"Masala dosa"
#define TITLE3 @"Potato chips"
#define TITLE4 @"Seafood paella"
#define TITLE5 @"Som tam"
#define TITLE6 @"Chicken rice"
#define TITLE7 @"Poutine"
#define TITLE8 @"Tacos"
#define TITLE9 @"Buttered toast with Marmite"
#define TITLE10 @"Stinky tofu"
#define TITLE11 @"Marzipan"
#define TITLE12 @"Ketchup"
#define TITLE13 @"French toast"
#define TITLE14 @"Chicken parm"
#define TITLE15 @"Hummus"
#define TITLE16 @"Chili crab"
#define TITLE17 @"Maple syrup"
#define TITLE18 @"Fish chips"
#define TITLE19 @"Ankimo"
#define TITLE20 @"Parma ham"

#endif /* API_h */
