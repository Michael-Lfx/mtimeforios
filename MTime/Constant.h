//
//  Constant.h
//  MTime
//
//  Created by Michael on 11/8/14.
//  Copyright (c) 2014 IL. All rights reserved.
//

#ifndef MTime_Constant_h
#define MTime_Constant_h

// 函数----------------------------------------------------------------------------------------------
#if DEBUG
	#define MJLog(...) NSLog(__VA_ARGS__)
#else
	#define MJLog(...) //NSLog(__VA_ARGS__)
#endif

// 常量----------------------------------------------------------------------------------------------
#define MENU_TOP_BG @"menu_top_bg"
#define RECOMMEND_INDEX_TRAILER_BG @"recommend_index_trailer_blackbg"

#endif
