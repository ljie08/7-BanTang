//
//  UrlDefine.h
//  MyWeather
//
//  Created by lijie on 2017/7/27.
//  Copyright © 2017年 lijie. All rights reserved.
//

#ifndef UrlDefine_h
#define UrlDefine_h

//主页
#define BaseURL @"http://open3.bantangapp.com/"
#define BaseMidURL @"app_versions=6.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&device_token=cdfeebe5eef40d8a70833fddf132e1b75bc05bf3963eb2013c8d000563e7ea7a"
#define BaseLastURL @"&screensize=750&track_device_info=iPhone7%2C2&track_device_uuid=6785261A-C350-499C-9A2D-147D164CE04F&track_deviceid=FE77886F-45B9-4379-BD2E-D929B905B870&track_user_id=2930975&v=25"

//http://open3.bantangapp.com/products/brandProduct/relationRec

// 最新
// 刷新时间last_get_time=1505119676
#define HomeNewURL @"recommend/index?app_id=com.jzyd.BanTang&app_installtime=1505109991&app_open_count=5&%@&isfromhome=1&last_get_time=1505109991&oauth_token=9922e109139d827f9c686cb1a4bb6f75&os_versions=10.3.1&page=0&pagesize=%ld"

//http://open3.bantangapp.com/topics/topic/listByAttribute

#define HomeBaseURL @"topics/topic/listByAttribute?"

// Base + homebase + basemid + food + baselast + pagesize
// 美食
#define HomeFoodURL @"app_id=com.jzyd.BanTang&app_installtime=1505109991&%@&ids=11&isfromhome=1&oauth_token=9922e109139d827f9c686cb1a4bb6f75&os_versions=10.3.1&page=0&pagesize=%ld"


// 礼物
#define HomeGiftURL @"app_id=com.jzyd.BanTang&app_installtime=1505109991&%@&ids=21&isfromhome=1&oauth_token=9922e109139d827f9c686cb1a4bb6f75&os_versions=10.3.1&page=0&pagesize=%ld"

// 生活
#define HomeLifeURL @"app_id=com.jzyd.BanTang&app_installtime=1505109991&%@&ids=3&isfromhome=1&oauth_token=9922e109139d827f9c686cb1a4bb6f75&os_versions=10.3.1&page=0&pagesize=%ld"

// 设计感
#define HomeDesignURL @"app_id=com.jzyd.BanTang&app_installtime=1505109991&%@&ids=20&isfromhome=1&oauth_token=9922e109139d827f9c686cb1a4bb6f75&os_versions=10.3.1&page=0&pagesize=%ld"

// 数码
#define HomeElectronicURL @"app_id=com.jzyd.BanTang&app_installtime=1505109991&%@&ids=2&isfromhome=1&oauth_token=9922e109139d827f9c686cb1a4bb6f75&os_versions=10.3.1&page=0&pagesize=%ld"

// 家居
#define HomeHomeURL @"app_id=com.jzyd.BanTang&app_installtime=1505109991&%@&ids=13&isfromhome=1&oauth_token=9922e109139d827f9c686cb1a4bb6f75&os_versions=10.3.1&page=0&pagesize=%ld"

// 阅读
#define HomeReadingURL @"app_id=com.jzyd.BanTang&app_installtime=1505109991&%@&ids=12&isfromhome=1&oauth_token=9922e109139d827f9c686cb1a4bb6f75&os_versions=10.3.1&page=0&pagesize=%ld"

// 学生党
#define HomeStudentURL @"app_id=com.jzyd.BanTang&app_installtime=1505109991&%@&ids=23&isfromhome=1&oauth_token=9922e109139d827f9c686cb1a4bb6f75&os_versions=10.3.1&page=0&pagesize=%ld"

// 上班族
#define HomeOfficeURL @"app_id=com.jzyd.BanTang&app_installtime=1505109991&%@&ids=9&isfromhome=1&oauth_token=9922e109139d827f9c686cb1a4bb6f75&os_versions=10.3.1&page=0&pagesize=%ld"

// 美妆
#define HomeBeautyURL @"app_id=com.jzyd.BanTang&app_installtime=1505109991&%@&ids=14&isfromhome=1&oauth_token=9922e109139d827f9c686cb1a4bb6f75&os_versions=10.3.1&page=0&pagesize=%ld"

// 护理
#define HomeNurseURL @"app_id=com.jzyd.BanTang&app_installtime=1505109991&%@&ids=1&isfromhome=1&oauth_token=9922e109139d827f9c686cb1a4bb6f75&os_versions=10.3.1&page=0&pagesize=%ld"

// 运动户外
#define HomeSportURL @"app_id=com.jzyd.BanTang&app_installtime=1505109991&%@&ids=26&isfromhome=1&oauth_token=9922e109139d827f9c686cb1a4bb6f75&os_versions=10.3.1&page=0&pagesize=%ld"


// 搜索
#define HomeRecommendURL @"category/list?app_id=com.jzyd.BanTang&app_installtime=1505109991&%@&is_new=1&is_rec_cate=1&oauth_token=9922e109139d827f9c686cb1a4bb6f75&os_versions=10.3.1"

// Base + banner + mid +last
// banner
//http://open3.bantangapp.com/recommend/operationElement?
#define BannerURL @"recommend/operationElement?app_id=com.jzyd.BanTang&app_installtime=1505109991&%@&oauth_token=9922e109139d827f9c686cb1a4bb6f75&os_versions=10.3.1"
//app_id=com.jzyd.BanTang&app_installtime=1505109991&app_versions=6.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&device_token=cdfeebe5eef40d8a70833fddf132e1b75bc05bf3963eb2013c8d000563e7ea7a&oauth_token=9922e109139d827f9c686cb1a4bb6f75&os_versions=10.3.1&screensize=750&track_device_info=iPhone7%2C2&track_device_uuid=6785261A-C350-499C-9A2D-147D164CE04F&track_deviceid=FE77886F-45B9-4379-BD2E-D929B905B870&track_user_id=2930975&v=25

#pragma mark - -发现

#define DiscoverBaseURL @"post/index/"
// base + disbase + url + mid + page + last
// 最新
#define DiscoverNewURL @"listByNew?app_id=com.jzyd.BanTang&app_installtime=1505109991&%@&oauth_token=9922e109139d827f9c686cb1a4bb6f75&os_versions=10.3.1&page=0&pagesize=%ld"

// 最热
#define DiscoverHotURL @"listByRec?app_id=com.jzyd.BanTang&app_installtime=1505109991&%@&oauth_token=9922e109139d827f9c686cb1a4bb6f75&os_versions=10.3.1&page=0&pagesize=%ld"

#pragma mark - 二级详情
// 首页
// 传一个id=21498
// Base + homedetail + mid + id + last
#define HomeDetailURL @"topic/newInfo?app_id=com.jzyd.BanTang&app_installtime=1505109991&%@&id=%@"
#define DetailLastURL @"&is_night=0&oauth_token=9922e109139d827f9c686cb1a4bb6f75&os_versions=10.3.1&screensize=750&statistics_uv=0&track_device_info=iPhone7%2C2&track_device_uuid=6785261A-C350-499C-9A2D-147D164CE04F&track_deviceid=FE77886F-45B9-4379-BD2E-D929B905B870&track_user_id=2930975&v=25"

// 最新、最热 二级
// 传一个id=167216
// Base + homedetail + mid + id + detaillast
#define DiscoverNewDetailURL @"post/post/info?app_id=com.jzyd.BanTang&app_installtime=1505109991&%@&id=%@&oauth_token=9922e109139d827f9c686cb1a4bb6f75&os_versions=10.3.1"

//http://open3.bantangapp.com/post/post/info?app_id=com.jzyd.BanTang&app_installtime=1505109991&app_versions=6.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&device_token=cdfeebe5eef40d8a70833fddf132e1b75bc05bf3963eb2013c8d000563e7ea7a&id=167216&oauth_token=9922e109139d827f9c686cb1a4bb6f75&os_versions=10.3.1&screensize=750&track_device_info=iPhone7%2C2&track_device_uuid=6785261A-C350-499C-9A2D-147D164CE04F&track_deviceid=FE77886F-45B9-4379-BD2E-D929B905B870&track_user_id=2930975&v=25

//http://open3.bantangapp.com/post/index/post/post/info?app_id=com.jzyd.BanTang&app_installtime=1505109991&app_versions=6.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&device_token=cdfeebe5eef40d8a70833fddf132e1b75bc05bf3963eb2013c8d000563e7ea7a&id=21408&oauth_token=9922e109139d827f9c686cb1a4bb6f75&os_versions=10.3.1&is_night=0&oauth_token=9922e109139d827f9c686cb1a4bb6f75&os_versions=10.3.1&screensize=750&statistics_uv=0&track_device_info=iPhone7%2C2&track_device_uuid=6785261A-C350-499C-9A2D-147D164CE04F&track_deviceid=FE77886F-45B9-4379-BD2E-D929B905B870&track_user_id=2930975&v=25

#endif /* UrlDefine_h */
