//
//  StoreRanking.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 13/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

let storeRankingSample: Data =
"""
{
  "best100": [
  {
  "id": 141,
  "brand_name": "오맘스",
  "name": "아트 조립식 바닥재 9p/18p 세트",
  "discount_rate": "50",
  "price": 19900,
  "review_count": 10,
  "star_avg": "4.90",
  "thumnail_images": [
  {
  "id": 743,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1552628823_102097_15.jpg/1700/1700",
  "product": 141
  }
  ]
  },
  {
  "id": 135,
  "brand_name": "마켓비",
  "name": "MUPAN 원목 조립마루(30x30/10개입)",
  "discount_rate": "47",
  "price": 26900,
  "review_count": 15,
  "star_avg": "4.87",
  "thumnail_images": [
  {
  "id": 722,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1545192774187_phFLySKv8.jpg/1700/1700",
  "product": 135
  }
  ]
  },
  {
  "id": 10,
  "brand_name": "모리앤",
  "name": "인테리어 행잉가랜드",
  "discount_rate": "33",
  "price": 8900,
  "review_count": 10,
  "star_avg": "4.80",
  "thumnail_images": [
  {
  "id": 143,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1530693506492_IpE5X.jpg/1700/1700",
  "product": 10
  }
  ]
  },
  {
  "id": 46,
  "brand_name": "FREESPACE",
  "name": "1+1 붙이는 셀프블라인드 5colors",
  "discount_rate": "19",
  "price": 7900,
  "review_count": 15,
  "star_avg": "4.73",
  "thumnail_images": [
  {
  "id": 333,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1525855310766_Ux.jpg/1700/1700",
  "product": 46
  }
  ]
  },
  {
  "id": 43,
  "brand_name": "아이르",
  "name": "[기간한정] 순면 누빔패드/누빔매트커버 모음전",
  "discount_rate": "59",
  "price": 12900,
  "review_count": 30,
  "star_avg": "4.70",
  "thumnail_images": [
  {
  "id": 315,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1516603788955_AjC.jpg/1700/1700",
  "product": 43
  }
  ]
  },
  {
  "id": 101,
  "brand_name": "테리파머",
  "name": "호텔타월 리본포장 170g/180g/200g",
  "discount_rate": "48",
  "price": 19900,
  "review_count": 10,
  "star_avg": "4.70",
  "thumnail_images": [
  {
  "id": 556,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1550652178620_l3qN1Zh4Nj.jpg/1700/1700",
  "product": 101
  }
  ]
  },
  {
  "id": 127,
  "brand_name": "룸플러스",
  "name": "고양이 의자발커버/의자발캡 4입",
  "discount_rate": "33",
  "price": 3600,
  "review_count": 10,
  "star_avg": "4.70",
  "thumnail_images": [
  {
  "id": 690,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-156169315503642353.jpg/1700/1700",
  "product": 127
  }
  ]
  },
  {
  "id": 72,
  "brand_name": "에이치홈",
  "name": "앙리 마티스 포스터 명화 그림 드로잉 엽서",
  "discount_rate": "16",
  "price": 1300,
  "review_count": 25,
  "star_avg": "4.68",
  "thumnail_images": [
  {
  "id": 467,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1549938593616_fad.jpg/1700/1700",
  "product": 72
  }
  ]
  },
  {
  "id": 58,
  "brand_name": "멜팅스튜디오",
  "name": "[무료배송] 앙리 마티스 아트 드로잉 100종",
  "discount_rate": "84",
  "price": 1900,
  "review_count": 30,
  "star_avg": "4.67",
  "thumnail_images": [
  {
  "id": 395,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1533944972709_0J.jpg/1700/1700",
  "product": 58
  }
  ]
  },
  {
  "id": 106,
  "brand_name": "HICKIES",
  "name": "KC인증 여름 장마철 습기제거 옷걸이형 대용량 제습제",
  "discount_rate": null,
  "price": 1000,
  "review_count": 15,
  "star_avg": "4.67",
  "thumnail_images": [
  {
  "id": 581,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1538380963_102149_1.jpg/1700/1700",
  "product": 106
  }
  ]
  },
  {
  "id": 76,
  "brand_name": "라쿠진",
  "name": "핸디형 터보 스팀다리미",
  "discount_rate": "51",
  "price": 33900,
  "review_count": 20,
  "star_avg": "4.65",
  "thumnail_images": [
  {
  "id": 482,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1524733525165_QwoB.jpg/1700/1700",
  "product": 76
  }
  ]
  },
  {
  "id": 74,
  "brand_name": "에이블루",
  "name": "전선정리 멀티탭/박스탭 3colors",
  "discount_rate": "59",
  "price": 19900,
  "review_count": 35,
  "star_avg": "4.63",
  "thumnail_images": [
  {
  "id": 471,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1531901650860_FPNitO3bs.jpg/1700/1700",
  "product": 74
  }
  ]
  },
  {
  "id": 3,
  "brand_name": "메종드룸룸",
  "name": "하노이 바나나 카페트 2sizes (베트남수입)",
  "discount_rate": "25",
  "price": 73500,
  "review_count": 35,
  "star_avg": "4.63",
  "thumnail_images": [
  {
  "id": 108,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1497250973938_6ROguEl.jpg/1700/1700",
  "product": 3
  }
  ]
  },
  {
  "id": 169,
  "brand_name": "울리",
  "name": "쿨매트 쿨방석 시리즈 / 여름방석",
  "discount_rate": "66",
  "price": 9900,
  "review_count": 45,
  "star_avg": "4.62",
  "thumnail_images": [
  {
  "id": 855,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-156228969890818804.jpg/1700/1700",
  "product": 169
  }
  ]
  },
  {
  "id": 137,
  "brand_name": "노루페인트",
  "name": "냄새없는 친환경 팬톤페인트",
  "discount_rate": "17",
  "price": 13900,
  "review_count": 20,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 726,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1552555471416_1KK.jpg/1700/1700",
  "product": 137
  }
  ]
  },
  {
  "id": 131,
  "brand_name": "룸스토어",
  "name": "DIY 셀프도배 풀바른 합지벽지",
  "discount_rate": "68",
  "price": 1500,
  "review_count": 10,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 706,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1497602549179_48OJ.jpg/1700/1700",
  "product": 131
  }
  ]
  },
  {
  "id": 103,
  "brand_name": "까사마루",
  "name": "매직 파티션 2colors (악세사리 추가구성)",
  "discount_rate": "32",
  "price": 35900,
  "review_count": 20,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 560,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1528187412416_QqpY.jpg/1700/1700",
  "product": 103
  }
  ]
  },
  {
  "id": 123,
  "brand_name": "생활만",
  "name": "양념통/오일병 3P/4P/5P 정리세트",
  "discount_rate": "47",
  "price": 4200,
  "review_count": 15,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 666,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1553065751812_Xj3.jpg/1700/1700",
  "product": 123
  }
  ]
  },
  {
  "id": 175,
  "brand_name": "그레이독",
  "name": "강아지/고양이 접이식욕조 폴딩텁 2colors",
  "discount_rate": "55",
  "price": 17900,
  "review_count": 10,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 881,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1542085943768_MZZRG7Vp84.jpg/1700/1700",
  "product": 175
  }
  ]
  },
  {
  "id": 84,
  "brand_name": "벨로닉스",
  "name": "6가지 간편기능 멀티쿠커 SHMC-018",
  "discount_rate": "23",
  "price": 59000,
  "review_count": 30,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 498,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1544146743278_yAsY.jpg/1700/1700",
  "product": 84
  }
  ]
  },
  {
  "id": 23,
  "brand_name": "리샘",
  "name": "스완 수납 화장대 2colors",
  "discount_rate": "58",
  "price": 69900,
  "review_count": 10,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 211,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1535346871119_B.jpg/1700/1700",
  "product": 23
  }
  ]
  },
  {
  "id": 149,
  "brand_name": "창안애",
  "name": "[5% 쿠폰] 25mm 알루미늄블라인드 46종",
  "discount_rate": "11",
  "price": 8900,
  "review_count": 15,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 800,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1536804354586_85e.jpg/1700/1700",
  "product": 149
  }
  ]
  },
  {
  "id": 52,
  "brand_name": "BHF",
  "name": "디망쉬 암막+속지커튼 4장세트 창문형/긴창형 모음 9colors",
  "discount_rate": "45",
  "price": 40900,
  "review_count": 15,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 362,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1533104916_102792_1.jpg/1700/1700",
  "product": 52
  }
  ]
  },
  {
  "id": 28,
  "brand_name": "오홀리브",
  "name": "액자테이블 BEST 50종 택1",
  "discount_rate": "34",
  "price": 16900,
  "review_count": 25,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 231,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1506408468701_j.jpg/1700/1700",
  "product": 28
  }
  ]
  },
  {
  "id": 31,
  "brand_name": "로제까사",
  "name": "국민 에펠체어 7colors",
  "discount_rate": "56",
  "price": 19800,
  "review_count": 30,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 253,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1488247220037_5y7nt.jpg/1700/1700",
  "product": 31
  }
  ]
  },
  {
  "id": 139,
  "brand_name": "네이쳐리빙",
  "name": "미세먼지 빗물막이 틈막이&바람막이 15종택1",
  "discount_rate": "29",
  "price": 990,
  "review_count": 40,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 735,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1508388288658_hYFxGaNaN.jpg/1700/1700",
  "product": 139
  }
  ]
  },
  {
  "id": 49,
  "brand_name": "이니띠움",
  "name": "[사각]러브 터치미 러그/카페트(4색상)",
  "discount_rate": "61",
  "price": 14800,
  "review_count": 15,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 346,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1535966707659_7FZfzt.jpg/1700/1700",
  "product": 49
  }
  ]
  },
  {
  "id": 51,
  "brand_name": "바이빔",
  "name": "선데이 러그 7size 5colors",
  "discount_rate": "36",
  "price": 17900,
  "review_count": 10,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 359,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1499928795848_dsUQ.jpg/1700/1700",
  "product": 51
  }
  ]
  },
  {
  "id": 164,
  "brand_name": "아르르",
  "name": "아르르 꿀잠방석 (단면 냉감 원단) 2size",
  "discount_rate": "53",
  "price": 64900,
  "review_count": 10,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 836,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1558577384660_b.jpg/1700/1700",
  "product": 164
  }
  ]
  },
  {
  "id": 94,
  "brand_name": "홈트너",
  "name": "알뜰 제습제 선반용8개+옷장용8개+서랍용8개",
  "discount_rate": "15",
  "price": 16900,
  "review_count": 35,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 524,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1559713812812_eXBNFX9.jpg/1700/1700",
  "product": 94
  }
  ]
  },
  {
  "id": 95,
  "brand_name": "리빙해피",
  "name": "뉴 논슬립 옷걸이 (화이트/그레이)",
  "discount_rate": "70",
  "price": 210,
  "review_count": 20,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 525,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1551941913066_F.jpg/1700/1700",
  "product": 95
  }
  ]
  },
  {
  "id": 176,
  "brand_name": "쁘리엘르펫",
  "name": "댕댕이 관절보호 강아지계단 2/3층",
  "discount_rate": "60",
  "price": 7900,
  "review_count": 40,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 885,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1560144217160_CLm3Qrf.jpg/1700/1700",
  "product": 176
  }
  ]
  },
  {
  "id": 66,
  "brand_name": "데이리브",
  "name": "LED 무소음 듀얼컬러 시계",
  "discount_rate": "70",
  "price": 14200,
  "review_count": 30,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 435,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1500106063921_A.jpg/1700/1700",
  "product": 66
  }
  ]
  },
  {
  "id": 8,
  "brand_name": "오션글라스",
  "name": "[1+1] 홈파티&혼술 시원한 맥주잔/유리컵 모음전",
  "discount_rate": "68",
  "price": 2500,
  "review_count": 10,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 131,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-156151488972741898.jpg/1700/1700",
  "product": 8
  }
  ]
  },
  {
  "id": 171,
  "brand_name": "고양이",
  "name": "전국냥냥자랑 (고양이 모아보기)",
  "discount_rate": "",
  "price": 2000,
  "review_count": 40,
  "star_avg": "4.58",
  "thumnail_images": [
  {
  "id": 863,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1546843967477_vS2.jpg/1700/1700",
  "product": 171
  }
  ]
  },
  {
  "id": 50,
  "brand_name": "마틸라",
  "name": "데일리 프리미엄 차렵이불(단품/세트) 11종",
  "discount_rate": "39",
  "price": 25700,
  "review_count": 45,
  "star_avg": "4.58",
  "thumnail_images": [
  {
  "id": 351,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1548233923257_5WVR.jpg/1700/1700",
  "product": 50
  }
  ]
  },
  {
  "id": 81,
  "brand_name": "네모탭",
  "name": "USB 멀티탭 3type(3구/4구/5구)",
  "discount_rate": "15",
  "price": 8400,
  "review_count": 40,
  "star_avg": "4.58",
  "thumnail_images": [
  {
  "id": 494,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1522213653883_qO0UbV6qR.jpg/1700/1700",
  "product": 81
  }
  ]
  },
  {
  "id": 71,
  "brand_name": "마켓비",
  "name": "[할인쿠폰] OMSTAD 단/장스탠드 5colors E26",
  "discount_rate": "71",
  "price": 28000,
  "review_count": 40,
  "star_avg": "4.58",
  "thumnail_images": [
  {
  "id": 462,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1499070467198_r.jpg/1700/1700",
  "product": 71
  }
  ]
  },
  {
  "id": 41,
  "brand_name": "이니띠움",
  "name": "[사각] 소프트 모던 러그/카페트 4colors",
  "discount_rate": "66",
  "price": 13900,
  "review_count": 50,
  "star_avg": "4.58",
  "thumnail_images": [
  {
  "id": 307,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1535966657093_ZNoz0.jpg/1700/1700",
  "product": 41
  }
  ]
  },
  {
  "id": 133,
  "brand_name": "현대L&C",
  "name": "인테리어필름 시트지 단색 58종택1",
  "discount_rate": "12",
  "price": 3500,
  "review_count": 46,
  "star_avg": "4.57",
  "thumnail_images": [
  {
  "id": 709,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1561099498781_S.jpg/1700/1700",
  "product": 133
  }
  ]
  },
  {
  "id": 21,
  "brand_name": "한샘",
  "name": "[7%쿠폰] [기간한정] 재크 철제 미니 수납장 양문형 (3종/택1)",
  "discount_rate": "49",
  "price": 29900,
  "review_count": 30,
  "star_avg": "4.57",
  "thumnail_images": [
  {
  "id": 200,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-156271820945523910.jpg/1700/1700",
  "product": 21
  }
  ]
  },
  {
  "id": 134,
  "brand_name": "프로메이드",
  "name": "조립식 데크타일 3colors 9P/36P",
  "discount_rate": "30",
  "price": 20900,
  "review_count": 35,
  "star_avg": "4.57",
  "thumnail_images": [
  {
  "id": 717,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1553576492460_PngzU7.jpg/1700/1700",
  "product": 134
  }
  ]
  },
  {
  "id": 32,
  "brand_name": "마켓비",
  "name": "BRUG 스탠드 행거 3colors",
  "discount_rate": "35",
  "price": 12900,
  "review_count": 35,
  "star_avg": "4.57",
  "thumnail_images": [
  {
  "id": 261,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1501035778987_gfy.jpg/1700/1700",
  "product": 32
  }
  ]
  },
  {
  "id": 104,
  "brand_name": "홈앤하우스",
  "name": "프리미엄 원목 옷걸이 20p",
  "discount_rate": "60",
  "price": 19900,
  "review_count": 35,
  "star_avg": "4.57",
  "thumnail_images": [
  {
  "id": 568,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1492574334100_mIBJb6BfT.jpg/1700/1700",
  "product": 104
  }
  ]
  },
  {
  "id": 138,
  "brand_name": "현대L&C",
  "name": "스티커형 보닥타일 빅브릭 5종 택1",
  "discount_rate": "41",
  "price": 4100,
  "review_count": 30,
  "star_avg": "4.57",
  "thumnail_images": [
  {
  "id": 729,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1547432636765_JB4.jpg/1700/1700",
  "product": 138
  }
  ]
  },
  {
  "id": 59,
  "brand_name": "APLUM",
  "name": "가방걸이 백맨",
  "discount_rate": "30",
  "price": 6900,
  "review_count": 35,
  "star_avg": "4.57",
  "thumnail_images": [
  {
  "id": 403,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1550210102905_PTFy0dv6FY.jpg/1700/1700",
  "product": 59
  }
  ]
  },
  {
  "id": 77,
  "brand_name": "O2케어",
  "name": "벽걸이형 헤드 칫솔살균기 4colors",
  "discount_rate": "15",
  "price": 10900,
  "review_count": 30,
  "star_avg": "4.57",
  "thumnail_images": [
  {
  "id": 484,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1514879087306_sNlBgK.jpg/1700/1700",
  "product": 77
  }
  ]
  },
  {
  "id": 115,
  "brand_name": "라이크하우스",
  "name": "호텔 디스펜서 모음",
  "discount_rate": "20",
  "price": 2000,
  "review_count": 30,
  "star_avg": "4.57",
  "thumnail_images": [
  {
  "id": 628,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1498723151135_k.jpg/1700/1700",
  "product": 115
  }
  ]
  },
  {
  "id": 57,
  "brand_name": "올루미",
  "name": "오로라 스탠드",
  "discount_rate": "58",
  "price": 23000,
  "review_count": 50,
  "star_avg": "4.56",
  "thumnail_images": [
  {
  "id": 392,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1527137912985_ugq8BBzY.jpg/1700/1700",
  "product": 57
  }
  ]
  },
  {
  "id": 44,
  "brand_name": "FREESPACE",
  "name": "커튼봉&압축봉 모음",
  "discount_rate": "38",
  "price": 1900,
  "review_count": 50,
  "star_avg": "4.56",
  "thumnail_images": [
  {
  "id": 323,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1531877155_102787_1.jpg/1700/1700",
  "product": 44
  }
  ]
  },
  {
  "id": 166,
  "brand_name": "페슬러",
  "name": "1+1 스펀지 배변패드 (소형/두툼형/대형)",
  "discount_rate": "30",
  "price": 13900,
  "review_count": 45,
  "star_avg": "4.56",
  "thumnail_images": [
  {
  "id": 843,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1537249209106_qBZQZWR.jpg/1700/1700",
  "product": 166
  }
  ]
  },
  {
  "id": 86,
  "brand_name": "빌보드",
  "name": "Retro All in One 블루투스 스피커 RT-02",
  "discount_rate": "31",
  "price": 25900,
  "review_count": 25,
  "star_avg": "4.56",
  "thumnail_images": [
  {
  "id": 500,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1541055942305_p.jpg/1700/1700",
  "product": 86
  }
  ]
  },
  {
  "id": 114,
  "brand_name": "니코트",
  "name": "우드 티스푼 티포크 버터나이프 롱스푼 외 24종 모음",
  "discount_rate": "54",
  "price": 1900,
  "review_count": 50,
  "star_avg": "4.56",
  "thumnail_images": [
  {
  "id": 624,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1547442215255_3.jpg/1700/1700",
  "product": 114
  }
  ]
  },
  {
  "id": 63,
  "brand_name": "마켓비",
  "name": "RUSTA 장 스탠드 11colors",
  "discount_rate": "14",
  "price": 17900,
  "review_count": 45,
  "star_avg": "4.56",
  "thumnail_images": [
  {
  "id": 426,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1500947643451_nFHEAthbo.jpg/1700/1700",
  "product": 63
  }
  ]
  },
  {
  "id": 45,
  "brand_name": "아이르",
  "name": "프리미엄 고밀도 호텔식 요토퍼(SS/Q) 3colors",
  "discount_rate": "72",
  "price": 28900,
  "review_count": 25,
  "star_avg": "4.56",
  "thumnail_images": [
  {
  "id": 326,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1523595870253_iIlDyh.jpg/1700/1700",
  "product": 45
  }
  ]
  },
  {
  "id": 14,
  "brand_name": "오션글라스",
  "name": "[1+1] 감성 HOMECAFE 커피잔&머그컵/유리컵 모음전",
  "discount_rate": "44",
  "price": 5500,
  "review_count": 40,
  "star_avg": "4.55",
  "thumnail_images": [
  {
  "id": 171,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-156151527337486293.jpg/1700/1700",
  "product": 14
  }
  ]
  },
  {
  "id": 117,
  "brand_name": "네이쳐리빙",
  "name": "[기간한정] 모던데일 걸이형 음식물 쓰레기통_2Size",
  "discount_rate": "54",
  "price": 5900,
  "review_count": 20,
  "star_avg": "4.55",
  "thumnail_images": [
  {
  "id": 640,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1546845022833_wikS.jpg/1700/1700",
  "product": 117
  }
  ]
  },
  {
  "id": 125,
  "brand_name": "크라운포드",
  "name": "영국 크라운포드 2인 홈세트 14P",
  "discount_rate": "91",
  "price": 15900,
  "review_count": 20,
  "star_avg": "4.55",
  "thumnail_images": [
  {
  "id": 680,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-156205291723877806.jpg/1700/1700",
  "product": 125
  }
  ]
  },
  {
  "id": 130,
  "brand_name": "세레스홈",
  "name": "Mary 원목 조립식마루 10P 3colors",
  "discount_rate": "54",
  "price": 23900,
  "review_count": 40,
  "star_avg": "4.55",
  "thumnail_images": [
  {
  "id": 699,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1539004321580_NqVLwnqm.jpg/1700/1700",
  "product": 130
  }
  ]
  },
  {
  "id": 36,
  "brand_name": "리샘",
  "name": "캐더린 LED 수납침대 슈퍼싱글(SS)/퀸(Q)",
  "discount_rate": "29",
  "price": 159000,
  "review_count": 40,
  "star_avg": "4.55",
  "thumnail_images": [
  {
  "id": 279,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1560155152674_EwQw.jpg/1700/1700",
  "product": 36
  }
  ]
  },
  {
  "id": 163,
  "brand_name": "세븐펫",
  "name": "강아지 미끄럼방지 도톰매트 10P",
  "discount_rate": "50",
  "price": 15900,
  "review_count": 50,
  "star_avg": "4.54",
  "thumnail_images": [
  {
  "id": 831,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1536640866303_mY3kffcIO.jpg/1700/1700",
  "product": 163
  }
  ]
  },
  {
  "id": 4,
  "brand_name": "지누스",
  "name": "[아마존1위] 쿨링 쿨토퍼 메모리폼 매트리스 (S/SS/Q)",
  "discount_rate": "18",
  "price": 129000,
  "review_count": 35,
  "star_avg": "4.54",
  "thumnail_images": [
  {
  "id": 112,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1559017970548_ucsL4r1AP.jpg/1700/1700",
  "product": 4
  }
  ]
  },
  {
  "id": 83,
  "brand_name": "LG전자",
  "name": "[판매1위] PH550 시네빔 무선 빔프로젝터 / 내장배터리",
  "discount_rate": "27",
  "price": 458000,
  "review_count": 35,
  "star_avg": "4.54",
  "thumnail_images": [
  {
  "id": 497,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1510735716850_y9818d.jpg/1700/1700",
  "product": 83
  }
  ]
  },
  {
  "id": 85,
  "brand_name": "파벡스",
  "name": "레트로 스텐 케틀 ZL-18CP 3colors",
  "discount_rate": "71",
  "price": 27900,
  "review_count": 50,
  "star_avg": "4.54",
  "thumnail_images": [
  {
  "id": 499,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1548913004749_pw.jpg/1700/1700",
  "product": 85
  }
  ]
  },
  {
  "id": 121,
  "brand_name": "생활공작소",
  "name": "고무장갑 3p/5p/ 일회용수세미 최저가구성",
  "discount_rate": "22",
  "price": 6900,
  "review_count": 50,
  "star_avg": "4.54",
  "thumnail_images": [
  {
  "id": 661,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1560928997383_EeowQYbvBi.jpg/1700/1700",
  "product": 121
  }
  ]
  },
  {
  "id": 96,
  "brand_name": "디얼리빙",
  "name": "논슬립 옷걸이 바지걸이 12종 모음전",
  "discount_rate": "83",
  "price": 160,
  "review_count": 35,
  "star_avg": "4.54",
  "thumnail_images": [
  {
  "id": 530,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-156264952040527432.jpg/1700/1700",
  "product": 96
  }
  ]
  },
  {
  "id": 147,
  "brand_name": "창안애",
  "name": "[5% 쿠폰] 암막방염 블라인드 롤스크린 22종",
  "discount_rate": "66",
  "price": 4500,
  "review_count": 45,
  "star_avg": "4.53",
  "thumnail_images": [
  {
  "id": 784,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1536749607464_yOP0mKKeZO.jpg/1700/1700",
  "product": 147
  }
  ]
  },
  {
  "id": 7,
  "brand_name": "네이쳐리빙",
  "name": "진드기방지 방수 매트리스커버&베개커버 2colors",
  "discount_rate": "55",
  "price": 4500,
  "review_count": 30,
  "star_avg": "4.53",
  "thumnail_images": [
  {
  "id": 127,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1549954569307_GBSwDSun.jpg/1700/1700",
  "product": 7
  }
  ]
  },
  {
  "id": 11,
  "brand_name": "생활공작소",
  "name": "제습제 520ml x 24입",
  "discount_rate": "29",
  "price": 16900,
  "review_count": 30,
  "star_avg": "4.53",
  "thumnail_images": [
  {
  "id": 151,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1560929118900_0mymft.jpg/1700/1700",
  "product": 11
  }
  ]
  },
  {
  "id": 19,
  "brand_name": "아이와비",
  "name": "카페 패브릭 접이식 소파베드 3colors",
  "discount_rate": "44",
  "price": 89000,
  "review_count": 15,
  "star_avg": "4.53",
  "thumnail_images": [
  {
  "id": 195,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1549384435034_ELc1O.jpg/1700/1700",
  "product": 19
  }
  ]
  },
  {
  "id": 47,
  "brand_name": "데이리브",
  "name": "[초특가] 호텔룸 레더 티슈케이스 8colors (사각,원형)",
  "discount_rate": "72",
  "price": 3900,
  "review_count": 30,
  "star_avg": "4.53",
  "thumnail_images": [
  {
  "id": 338,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1508765223818_tUfqrCa8b.jpg/1700/1700",
  "product": 47
  }
  ]
  },
  {
  "id": 53,
  "brand_name": "창안애",
  "name": "[5% 쿠폰] 내츄럴 콤비블라인드 롤스크린 19종",
  "discount_rate": "40",
  "price": 3000,
  "review_count": 45,
  "star_avg": "4.53",
  "thumnail_images": [
  {
  "id": 370,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1536727796781_VTH58v.jpg/1700/1700",
  "product": 53
  }
  ]
  },
  {
  "id": 68,
  "brand_name": "포클로버",
  "name": "감성 글귀 레터링 스티커",
  "discount_rate": "",
  "price": 3900,
  "review_count": 30,
  "star_avg": "4.53",
  "thumnail_images": [
  {
  "id": 449,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1539240112075_9e04xss.jpg/1700/1700",
  "product": 68
  }
  ]
  },
  {
  "id": 82,
  "brand_name": "휴비딕",
  "name": "핸디형 스팀다리미 HWS-2 2colors",
  "discount_rate": "60",
  "price": 17500,
  "review_count": 45,
  "star_avg": "4.53",
  "thumnail_images": [
  {
  "id": 496,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1548910367_101165_1.jpg/1700/1700",
  "product": 82
  }
  ]
  },
  {
  "id": 111,
  "brand_name": "네이쳐리빙",
  "name": "어반모카&크림 주방수납용품 22종 택1",
  "discount_rate": "43",
  "price": 3900,
  "review_count": 30,
  "star_avg": "4.53",
  "thumnail_images": [
  {
  "id": 607,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1524190555265_C7wchsyo8.jpg/1700/1700",
  "product": 111
  }
  ]
  },
  {
  "id": 144,
  "brand_name": "페인트인포",
  "name": "와이어 레일/액자걸이 모음",
  "discount_rate": "30",
  "price": 900,
  "review_count": 40,
  "star_avg": "4.53",
  "thumnail_images": [
  {
  "id": 763,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1536719141_116365_1.jpg/1700/1700",
  "product": 144
  }
  ]
  },
  {
  "id": 2,
  "brand_name": "에어스미스",
  "name": "BLDC모터 선풍기 모음",
  "discount_rate": "52",
  "price": 59500,
  "review_count": 47,
  "star_avg": "4.53",
  "thumnail_images": [
  {
  "id": 105,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-sub_images-1558576961048_SAkvx.jpg/1700/1700",
  "product": 2
  }
  ]
  },
  {
  "id": 18,
  "brand_name": "프로텍트어베드",
  "name": "방수 매트리스커버 모음전",
  "discount_rate": "55",
  "price": 16900,
  "review_count": 36,
  "star_avg": "4.53",
  "thumnail_images": [
  {
  "id": 189,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1520908802434_Iek4qZPZ9.jpg/1700/1700",
  "product": 18
  }
  ]
  },
  {
  "id": 118,
  "brand_name": "네이쳐리빙",
  "name": "다이어트 시리얼통/쌀통/귀리&잡곡통/주방수납 모음",
  "discount_rate": "55",
  "price": 4900,
  "review_count": 50,
  "star_avg": "4.52",
  "thumnail_images": [
  {
  "id": 648,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1525409646049_jVLNZiBj.jpg/1700/1700",
  "product": 118
  }
  ]
  },
  {
  "id": 98,
  "brand_name": "네이쳐리빙",
  "name": "논슬립 바지걸이&옷걸이 모음전",
  "discount_rate": "47",
  "price": 1900,
  "review_count": 35,
  "star_avg": "4.51",
  "thumnail_images": [
  {
  "id": 543,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1509329183_107373_1.jpg/1700/1700",
  "product": 98
  }
  ]
  },
  {
  "id": 105,
  "brand_name": "마켓비",
  "name": "BRUG 스탠드 행거 3colors",
  "discount_rate": "35",
  "price": 12900,
  "review_count": 41,
  "star_avg": "4.51",
  "thumnail_images": [
  {
  "id": 574,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1501035778987_gfy.jpg/1700/1700",
  "product": 105
  }
  ]
  },
  {
  "id": 116,
  "brand_name": "홈앤하우스",
  "name": "프리모 실리콘 스테인리스 조리도구 택1",
  "discount_rate": "43",
  "price": 3900,
  "review_count": 35,
  "star_avg": "4.51",
  "thumnail_images": [
  {
  "id": 634,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1511934309_107770_1.jpg/1700/1700",
  "product": 116
  }
  ]
  },
  {
  "id": 69,
  "brand_name": "코코도르",
  "name": "1+1+1+1 뉴CO 디퓨저 200ml",
  "discount_rate": "78",
  "price": 17500,
  "review_count": 20,
  "star_avg": "4.50",
  "thumnail_images": [
  {
  "id": 457,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1548337413096_uk.jpg/1700/1700",
  "product": 69
  }
  ]
  },
  {
  "id": 27,
  "brand_name": "먼데이하우스",
  "name": "LEITER 철제 선반 3type 6colors",
  "discount_rate": "54",
  "price": 16100,
  "review_count": 30,
  "star_avg": "4.50",
  "thumnail_images": [
  {
  "id": 224,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1529414013647_Pw5OMMi.jpg/1700/1700",
  "product": 27
  }
  ]
  },
  {
  "id": 29,
  "brand_name": "마켓비",
  "name": "[할인쿠폰] FIHA 철제 서랍장 5종 7colors",
  "discount_rate": "15",
  "price": 33900,
  "review_count": 20,
  "star_avg": "4.50",
  "thumnail_images": [
  {
  "id": 239,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1559294769371_zTq.jpg/1700/1700",
  "product": 29
  }
  ]
  },
  {
  "id": 22,
  "brand_name": "로제까사",
  "name": "KUBO 철제 책상",
  "discount_rate": "16",
  "price": 44900,
  "review_count": 20,
  "star_avg": "4.50",
  "thumnail_images": [
  {
  "id": 205,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1542725984761_UW8.jpg/1700/1700",
  "product": 22
  }
  ]
  },
  {
  "id": 17,
  "brand_name": "포에마",
  "name": "미니다육-클리어",
  "discount_rate": "28",
  "price": 3200,
  "review_count": 10,
  "star_avg": "4.50",
  "thumnail_images": [
  {
  "id": 186,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1476199444378_kgbQ.jpg/1700/1700",
  "product": 17
  }
  ]
  },
  {
  "id": 12,
  "brand_name": "꾸미까",
  "name": "내츄럴 해초바구니(왕골 항아리바구니) 12type",
  "discount_rate": "9",
  "price": 4900,
  "review_count": 40,
  "star_avg": "4.50",
  "thumnail_images": [
  {
  "id": 156,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-156168764291606622.jpg/1700/1700",
  "product": 12
  }
  ]
  },
  {
  "id": 39,
  "brand_name": "한일카페트",
  "name": "터치미 극세사 러그 - 원형/사각",
  "discount_rate": "75",
  "price": 14200,
  "review_count": 50,
  "star_avg": "4.50",
  "thumnail_images": [
  {
  "id": 292,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1542265120933_Rs.jpg/1700/1700",
  "product": 39
  }
  ]
  },
  {
  "id": 33,
  "brand_name": "두닷",
  "name": "마리에1500 스탠드 전신거울 4colors",
  "discount_rate": "44",
  "price": 32900,
  "review_count": 40,
  "star_avg": "4.50",
  "thumnail_images": [
  {
  "id": 268,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-101797_1.jpg/1700/1700",
  "product": 33
  }
  ]
  },
  {
  "id": 112,
  "brand_name": "몽블랑",
  "name": "에펠 골드,샤틴 커트러리 양식기 모음",
  "discount_rate": "63",
  "price": 2900,
  "review_count": 10,
  "star_avg": "4.50",
  "thumnail_images": [
  {
  "id": 611,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1548335841858_I3hfyN.jpg/1700/1700",
  "product": 112
  }
  ]
  },
  {
  "id": 120,
  "brand_name": "카모메키친",
  "name": "모노디 수저통",
  "discount_rate": "14",
  "price": 15900,
  "review_count": 40,
  "star_avg": "4.50",
  "thumnail_images": [
  {
  "id": 659,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1475816058074_XueAhz.jpg/1700/1700",
  "product": 120
  }
  ]
  },
  {
  "id": 102,
  "brand_name": "라벨라코",
  "name": "1+1 퓨어 말랑욕실화 7colors",
  "discount_rate": "",
  "price": 6900,
  "review_count": 45,
  "star_avg": "4.49",
  "thumnail_images": [
  {
  "id": 558,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1488850843797_jVvXw.jpg/1700/1700",
  "product": 102
  }
  ]
  },
  {
  "id": 62,
  "brand_name": "무아스",
  "name": "3D LED 시계 11종",
  "discount_rate": "42",
  "price": 14200,
  "review_count": 45,
  "star_avg": "4.49",
  "thumnail_images": [
  {
  "id": 418,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1560486601685_xW.jpg/1700/1700",
  "product": 62
  }
  ]
  },
  {
  "id": 9,
  "brand_name": "어번던스",
  "name": "행잉 패브릭 포스터 100종 택1",
  "discount_rate": "20",
  "price": 15800,
  "review_count": 45,
  "star_avg": "4.49",
  "thumnail_images": [
  {
  "id": 137,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1533798024698_2z1JQGB.jpg/1700/1700",
  "product": 9
  }
  ]
  },
  {
  "id": 79,
  "brand_name": "바비리스",
  "name": "2000W 전문가용 드라이기",
  "discount_rate": "42",
  "price": 18900,
  "review_count": 25,
  "star_avg": "4.48",
  "thumnail_images": [
  {
  "id": 489,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1542092822350_Ny8vcu.jpg/1700/1700",
  "product": 79
  }
  ]
  },
  {
  "id": 38,
  "brand_name": "바자르",
  "name": "쿨젤방석 / 쿨젤베개 / 쿨매트 6colors",
  "discount_rate": "76",
  "price": 6900,
  "review_count": 25,
  "star_avg": "4.48",
  "thumnail_images": [
  {
  "id": 284,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1558597577364_7CDOP6EihN.jpg/1700/1700",
  "product": 38
  }
  ]
  },
  {
  "id": 113,
  "brand_name": "카모메키친",
  "name": "카모메 수저세트 1+1 10colors",
  "discount_rate": "15",
  "price": 11800,
  "review_count": 50,
  "star_avg": "4.48",
  "thumnail_images": [
  {
  "id": 618,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1500297221099_uk.jpg/1700/1700",
  "product": 113
  }
  ]
  },
  {
  "id": 172,
  "brand_name": "그레이독",
  "name": "고양이 윈도우해먹",
  "discount_rate": "40",
  "price": 17900,
  "review_count": 25,
  "star_avg": "4.48",
  "thumnail_images": [
  {
  "id": 867,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1542344586266_qDbp.jpg/1700/1700",
  "product": 172
  }
  ]
  },
  {
  "id": 148,
  "brand_name": "창안애",
  "name": "[5% 쿠폰] 물청소가능! 우드폼블라인드 14종",
  "discount_rate": "34",
  "price": 9900,
  "review_count": 25,
  "star_avg": "4.48",
  "thumnail_images": [
  {
  "id": 792,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1503897072195_tC.jpg/1700/1700",
  "product": 148
  }
  ]
  }
  ],
  "light_homedeco": [
  {
  "id": 72,
  "brand_name": "에이치홈",
  "name": "앙리 마티스 포스터 명화 그림 드로잉 엽서",
  "discount_rate": "16",
  "price": 1300,
  "review_count": 25,
  "star_avg": "4.68",
  "thumnail_images": [
  {
  "id": 467,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1549938593616_fad.jpg/1700/1700",
  "product": 72
  }
  ]
  },
  {
  "id": 58,
  "brand_name": "멜팅스튜디오",
  "name": "[무료배송] 앙리 마티스 아트 드로잉 100종",
  "discount_rate": "84",
  "price": 1900,
  "review_count": 30,
  "star_avg": "4.67",
  "thumnail_images": [
  {
  "id": 395,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1533944972709_0J.jpg/1700/1700",
  "product": 58
  }
  ]
  },
  {
  "id": 66,
  "brand_name": "데이리브",
  "name": "LED 무소음 듀얼컬러 시계",
  "discount_rate": "70",
  "price": 14200,
  "review_count": 30,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 435,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1500106063921_A.jpg/1700/1700",
  "product": 66
  }
  ]
  },
  {
  "id": 71,
  "brand_name": "마켓비",
  "name": "[할인쿠폰] OMSTAD 단/장스탠드 5colors E26",
  "discount_rate": "71",
  "price": 28000,
  "review_count": 40,
  "star_avg": "4.58",
  "thumnail_images": [
  {
  "id": 462,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1499070467198_r.jpg/1700/1700",
  "product": 71
  }
  ]
  },
  {
  "id": 59,
  "brand_name": "APLUM",
  "name": "가방걸이 백맨",
  "discount_rate": "30",
  "price": 6900,
  "review_count": 35,
  "star_avg": "4.57",
  "thumnail_images": [
  {
  "id": 403,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1550210102905_PTFy0dv6FY.jpg/1700/1700",
  "product": 59
  }
  ]
  },
  {
  "id": 63,
  "brand_name": "마켓비",
  "name": "RUSTA 장 스탠드 11colors",
  "discount_rate": "14",
  "price": 17900,
  "review_count": 45,
  "star_avg": "4.56",
  "thumnail_images": [
  {
  "id": 426,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1500947643451_nFHEAthbo.jpg/1700/1700",
  "product": 63
  }
  ]
  },
  {
  "id": 57,
  "brand_name": "올루미",
  "name": "오로라 스탠드",
  "discount_rate": "58",
  "price": 23000,
  "review_count": 50,
  "star_avg": "4.56",
  "thumnail_images": [
  {
  "id": 392,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1527137912985_ugq8BBzY.jpg/1700/1700",
  "product": 57
  }
  ]
  },
  {
  "id": 68,
  "brand_name": "포클로버",
  "name": "감성 글귀 레터링 스티커",
  "discount_rate": "",
  "price": 3900,
  "review_count": 30,
  "star_avg": "4.53",
  "thumnail_images": [
  {
  "id": 449,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1539240112075_9e04xss.jpg/1700/1700",
  "product": 68
  }
  ]
  },
  {
  "id": 69,
  "brand_name": "코코도르",
  "name": "1+1+1+1 뉴CO 디퓨저 200ml",
  "discount_rate": "78",
  "price": 17500,
  "review_count": 20,
  "star_avg": "4.50",
  "thumnail_images": [
  {
  "id": 457,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1548337413096_uk.jpg/1700/1700",
  "product": 69
  }
  ]
  },
  {
  "id": 62,
  "brand_name": "무아스",
  "name": "3D LED 시계 11종",
  "discount_rate": "42",
  "price": 14200,
  "review_count": 45,
  "star_avg": "4.49",
  "thumnail_images": [
  {
  "id": 418,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1560486601685_xW.jpg/1700/1700",
  "product": 62
  }
  ]
  }
  ],
  "daily_supplies": [
  {
  "id": 101,
  "brand_name": "테리파머",
  "name": "호텔타월 리본포장 170g/180g/200g",
  "discount_rate": "48",
  "price": 19900,
  "review_count": 10,
  "star_avg": "4.70",
  "thumnail_images": [
  {
  "id": 556,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1550652178620_l3qN1Zh4Nj.jpg/1700/1700",
  "product": 101
  }
  ]
  },
  {
  "id": 106,
  "brand_name": "HICKIES",
  "name": "KC인증 여름 장마철 습기제거 옷걸이형 대용량 제습제",
  "discount_rate": null,
  "price": 1000,
  "review_count": 15,
  "star_avg": "4.67",
  "thumnail_images": [
  {
  "id": 581,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1538380963_102149_1.jpg/1700/1700",
  "product": 106
  }
  ]
  },
  {
  "id": 95,
  "brand_name": "리빙해피",
  "name": "뉴 논슬립 옷걸이 (화이트/그레이)",
  "discount_rate": "70",
  "price": 210,
  "review_count": 20,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 525,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1551941913066_F.jpg/1700/1700",
  "product": 95
  }
  ]
  },
  {
  "id": 94,
  "brand_name": "홈트너",
  "name": "알뜰 제습제 선반용8개+옷장용8개+서랍용8개",
  "discount_rate": "15",
  "price": 16900,
  "review_count": 35,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 524,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1559713812812_eXBNFX9.jpg/1700/1700",
  "product": 94
  }
  ]
  },
  {
  "id": 103,
  "brand_name": "까사마루",
  "name": "매직 파티션 2colors (악세사리 추가구성)",
  "discount_rate": "32",
  "price": 35900,
  "review_count": 20,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 560,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1528187412416_QqpY.jpg/1700/1700",
  "product": 103
  }
  ]
  },
  {
  "id": 104,
  "brand_name": "홈앤하우스",
  "name": "프리미엄 원목 옷걸이 20p",
  "discount_rate": "60",
  "price": 19900,
  "review_count": 35,
  "star_avg": "4.57",
  "thumnail_images": [
  {
  "id": 568,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1492574334100_mIBJb6BfT.jpg/1700/1700",
  "product": 104
  }
  ]
  },
  {
  "id": 96,
  "brand_name": "디얼리빙",
  "name": "논슬립 옷걸이 바지걸이 12종 모음전",
  "discount_rate": "83",
  "price": 160,
  "review_count": 35,
  "star_avg": "4.54",
  "thumnail_images": [
  {
  "id": 530,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-156264952040527432.jpg/1700/1700",
  "product": 96
  }
  ]
  },
  {
  "id": 105,
  "brand_name": "마켓비",
  "name": "BRUG 스탠드 행거 3colors",
  "discount_rate": "35",
  "price": 12900,
  "review_count": 41,
  "star_avg": "4.51",
  "thumnail_images": [
  {
  "id": 574,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1501035778987_gfy.jpg/1700/1700",
  "product": 105
  }
  ]
  },
  {
  "id": 98,
  "brand_name": "네이쳐리빙",
  "name": "논슬립 바지걸이&옷걸이 모음전",
  "discount_rate": "47",
  "price": 1900,
  "review_count": 35,
  "star_avg": "4.51",
  "thumnail_images": [
  {
  "id": 543,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1509329183_107373_1.jpg/1700/1700",
  "product": 98
  }
  ]
  },
  {
  "id": 102,
  "brand_name": "라벨라코",
  "name": "1+1 퓨어 말랑욕실화 7colors",
  "discount_rate": "",
  "price": 6900,
  "review_count": 45,
  "star_avg": "4.49",
  "thumnail_images": [
  {
  "id": 558,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1488850843797_jVvXw.jpg/1700/1700",
  "product": 102
  }
  ]
  }
  ],
  "fabric": [
  {
  "id": 46,
  "brand_name": "FREESPACE",
  "name": "1+1 붙이는 셀프블라인드 5colors",
  "discount_rate": "19",
  "price": 7900,
  "review_count": 15,
  "star_avg": "4.73",
  "thumnail_images": [
  {
  "id": 333,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1525855310766_Ux.jpg/1700/1700",
  "product": 46
  }
  ]
  },
  {
  "id": 43,
  "brand_name": "아이르",
  "name": "[기간한정] 순면 누빔패드/누빔매트커버 모음전",
  "discount_rate": "59",
  "price": 12900,
  "review_count": 30,
  "star_avg": "4.70",
  "thumnail_images": [
  {
  "id": 315,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1516603788955_AjC.jpg/1700/1700",
  "product": 43
  }
  ]
  },
  {
  "id": 51,
  "brand_name": "바이빔",
  "name": "선데이 러그 7size 5colors",
  "discount_rate": "36",
  "price": 17900,
  "review_count": 10,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 359,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1499928795848_dsUQ.jpg/1700/1700",
  "product": 51
  }
  ]
  },
  {
  "id": 52,
  "brand_name": "BHF",
  "name": "디망쉬 암막+속지커튼 4장세트 창문형/긴창형 모음 9colors",
  "discount_rate": "45",
  "price": 40900,
  "review_count": 15,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 362,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1533104916_102792_1.jpg/1700/1700",
  "product": 52
  }
  ]
  },
  {
  "id": 49,
  "brand_name": "이니띠움",
  "name": "[사각]러브 터치미 러그/카페트(4색상)",
  "discount_rate": "61",
  "price": 14800,
  "review_count": 15,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 346,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1535966707659_7FZfzt.jpg/1700/1700",
  "product": 49
  }
  ]
  },
  {
  "id": 50,
  "brand_name": "마틸라",
  "name": "데일리 프리미엄 차렵이불(단품/세트) 11종",
  "discount_rate": "39",
  "price": 25700,
  "review_count": 45,
  "star_avg": "4.58",
  "thumnail_images": [
  {
  "id": 351,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1548233923257_5WVR.jpg/1700/1700",
  "product": 50
  }
  ]
  },
  {
  "id": 41,
  "brand_name": "이니띠움",
  "name": "[사각] 소프트 모던 러그/카페트 4colors",
  "discount_rate": "66",
  "price": 13900,
  "review_count": 50,
  "star_avg": "4.58",
  "thumnail_images": [
  {
  "id": 307,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1535966657093_ZNoz0.jpg/1700/1700",
  "product": 41
  }
  ]
  },
  {
  "id": 45,
  "brand_name": "아이르",
  "name": "프리미엄 고밀도 호텔식 요토퍼(SS/Q) 3colors",
  "discount_rate": "72",
  "price": 28900,
  "review_count": 25,
  "star_avg": "4.56",
  "thumnail_images": [
  {
  "id": 326,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1523595870253_iIlDyh.jpg/1700/1700",
  "product": 45
  }
  ]
  },
  {
  "id": 44,
  "brand_name": "FREESPACE",
  "name": "커튼봉&압축봉 모음",
  "discount_rate": "38",
  "price": 1900,
  "review_count": 50,
  "star_avg": "4.56",
  "thumnail_images": [
  {
  "id": 323,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1531877155_102787_1.jpg/1700/1700",
  "product": 44
  }
  ]
  },
  {
  "id": 53,
  "brand_name": "창안애",
  "name": "[5% 쿠폰] 내츄럴 콤비블라인드 롤스크린 19종",
  "discount_rate": "40",
  "price": 3000,
  "review_count": 45,
  "star_avg": "4.53",
  "thumnail_images": [
  {
  "id": 370,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1536727796781_VTH58v.jpg/1700/1700",
  "product": 53
  }
  ]
  }
  ],
  "kitchenware": [
  {
  "id": 123,
  "brand_name": "생활만",
  "name": "양념통/오일병 3P/4P/5P 정리세트",
  "discount_rate": "47",
  "price": 4200,
  "review_count": 15,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 666,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1553065751812_Xj3.jpg/1700/1700",
  "product": 123
  }
  ]
  },
  {
  "id": 115,
  "brand_name": "라이크하우스",
  "name": "호텔 디스펜서 모음",
  "discount_rate": "20",
  "price": 2000,
  "review_count": 30,
  "star_avg": "4.57",
  "thumnail_images": [
  {
  "id": 628,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1498723151135_k.jpg/1700/1700",
  "product": 115
  }
  ]
  },
  {
  "id": 114,
  "brand_name": "니코트",
  "name": "우드 티스푼 티포크 버터나이프 롱스푼 외 24종 모음",
  "discount_rate": "54",
  "price": 1900,
  "review_count": 50,
  "star_avg": "4.56",
  "thumnail_images": [
  {
  "id": 624,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1547442215255_3.jpg/1700/1700",
  "product": 114
  }
  ]
  },
  {
  "id": 117,
  "brand_name": "네이쳐리빙",
  "name": "[기간한정] 모던데일 걸이형 음식물 쓰레기통_2Size",
  "discount_rate": "54",
  "price": 5900,
  "review_count": 20,
  "star_avg": "4.55",
  "thumnail_images": [
  {
  "id": 640,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1546845022833_wikS.jpg/1700/1700",
  "product": 117
  }
  ]
  },
  {
  "id": 125,
  "brand_name": "크라운포드",
  "name": "영국 크라운포드 2인 홈세트 14P",
  "discount_rate": "91",
  "price": 15900,
  "review_count": 20,
  "star_avg": "4.55",
  "thumnail_images": [
  {
  "id": 680,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-156205291723877806.jpg/1700/1700",
  "product": 125
  }
  ]
  },
  {
  "id": 121,
  "brand_name": "생활공작소",
  "name": "고무장갑 3p/5p/ 일회용수세미 최저가구성",
  "discount_rate": "22",
  "price": 6900,
  "review_count": 50,
  "star_avg": "4.54",
  "thumnail_images": [
  {
  "id": 661,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1560928997383_EeowQYbvBi.jpg/1700/1700",
  "product": 121
  }
  ]
  },
  {
  "id": 111,
  "brand_name": "네이쳐리빙",
  "name": "어반모카&크림 주방수납용품 22종 택1",
  "discount_rate": "43",
  "price": 3900,
  "review_count": 30,
  "star_avg": "4.53",
  "thumnail_images": [
  {
  "id": 607,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1524190555265_C7wchsyo8.jpg/1700/1700",
  "product": 111
  }
  ]
  },
  {
  "id": 118,
  "brand_name": "네이쳐리빙",
  "name": "다이어트 시리얼통/쌀통/귀리&잡곡통/주방수납 모음",
  "discount_rate": "55",
  "price": 4900,
  "review_count": 50,
  "star_avg": "4.52",
  "thumnail_images": [
  {
  "id": 648,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1525409646049_jVLNZiBj.jpg/1700/1700",
  "product": 118
  }
  ]
  },
  {
  "id": 116,
  "brand_name": "홈앤하우스",
  "name": "프리모 실리콘 스테인리스 조리도구 택1",
  "discount_rate": "43",
  "price": 3900,
  "review_count": 35,
  "star_avg": "4.51",
  "thumnail_images": [
  {
  "id": 634,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1511934309_107770_1.jpg/1700/1700",
  "product": 116
  }
  ]
  },
  {
  "id": 120,
  "brand_name": "카모메키친",
  "name": "모노디 수저통",
  "discount_rate": "14",
  "price": 15900,
  "review_count": 40,
  "star_avg": "4.50",
  "thumnail_images": [
  {
  "id": 659,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1475816058074_XueAhz.jpg/1700/1700",
  "product": 120
  }
  ]
  }
  ],
  "home_appliances": [
  {
  "id": 76,
  "brand_name": "라쿠진",
  "name": "핸디형 터보 스팀다리미",
  "discount_rate": "51",
  "price": 33900,
  "review_count": 20,
  "star_avg": "4.65",
  "thumnail_images": [
  {
  "id": 482,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1524733525165_QwoB.jpg/1700/1700",
  "product": 76
  }
  ]
  },
  {
  "id": 74,
  "brand_name": "에이블루",
  "name": "전선정리 멀티탭/박스탭 3colors",
  "discount_rate": "59",
  "price": 19900,
  "review_count": 35,
  "star_avg": "4.63",
  "thumnail_images": [
  {
  "id": 471,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1531901650860_FPNitO3bs.jpg/1700/1700",
  "product": 74
  }
  ]
  },
  {
  "id": 84,
  "brand_name": "벨로닉스",
  "name": "6가지 간편기능 멀티쿠커 SHMC-018",
  "discount_rate": "23",
  "price": 59000,
  "review_count": 30,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 498,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1544146743278_yAsY.jpg/1700/1700",
  "product": 84
  }
  ]
  },
  {
  "id": 81,
  "brand_name": "네모탭",
  "name": "USB 멀티탭 3type(3구/4구/5구)",
  "discount_rate": "15",
  "price": 8400,
  "review_count": 40,
  "star_avg": "4.58",
  "thumnail_images": [
  {
  "id": 494,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1522213653883_qO0UbV6qR.jpg/1700/1700",
  "product": 81
  }
  ]
  },
  {
  "id": 77,
  "brand_name": "O2케어",
  "name": "벽걸이형 헤드 칫솔살균기 4colors",
  "discount_rate": "15",
  "price": 10900,
  "review_count": 30,
  "star_avg": "4.57",
  "thumnail_images": [
  {
  "id": 484,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1514879087306_sNlBgK.jpg/1700/1700",
  "product": 77
  }
  ]
  },
  {
  "id": 86,
  "brand_name": "빌보드",
  "name": "Retro All in One 블루투스 스피커 RT-02",
  "discount_rate": "31",
  "price": 25900,
  "review_count": 25,
  "star_avg": "4.56",
  "thumnail_images": [
  {
  "id": 500,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1541055942305_p.jpg/1700/1700",
  "product": 86
  }
  ]
  },
  {
  "id": 85,
  "brand_name": "파벡스",
  "name": "레트로 스텐 케틀 ZL-18CP 3colors",
  "discount_rate": "71",
  "price": 27900,
  "review_count": 50,
  "star_avg": "4.54",
  "thumnail_images": [
  {
  "id": 499,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1548913004749_pw.jpg/1700/1700",
  "product": 85
  }
  ]
  },
  {
  "id": 83,
  "brand_name": "LG전자",
  "name": "[판매1위] PH550 시네빔 무선 빔프로젝터 / 내장배터리",
  "discount_rate": "27",
  "price": 458000,
  "review_count": 35,
  "star_avg": "4.54",
  "thumnail_images": [
  {
  "id": 497,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1510735716850_y9818d.jpg/1700/1700",
  "product": 83
  }
  ]
  },
  {
  "id": 82,
  "brand_name": "휴비딕",
  "name": "핸디형 스팀다리미 HWS-2 2colors",
  "discount_rate": "60",
  "price": 17500,
  "review_count": 45,
  "star_avg": "4.53",
  "thumnail_images": [
  {
  "id": 496,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1548910367_101165_1.jpg/1700/1700",
  "product": 82
  }
  ]
  },
  {
  "id": 88,
  "brand_name": "매직쉐프",
  "name": "전자레인지 20L 실속형 다이얼식 MEM-GP20B",
  "discount_rate": "22",
  "price": 53900,
  "review_count": 25,
  "star_avg": "4.48",
  "thumnail_images": [
  {
  "id": 505,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1537423407593_joUz8.jpg/1700/1700",
  "product": 88
  }
  ]
  }
  ],
  "companion_animal": [
  {
  "id": 169,
  "brand_name": "울리",
  "name": "쿨매트 쿨방석 시리즈 / 여름방석",
  "discount_rate": "66",
  "price": 9900,
  "review_count": 45,
  "star_avg": "4.62",
  "thumnail_images": [
  {
  "id": 855,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-156228969890818804.jpg/1700/1700",
  "product": 169
  }
  ]
  },
  {
  "id": 164,
  "brand_name": "아르르",
  "name": "아르르 꿀잠방석 (단면 냉감 원단) 2size",
  "discount_rate": "53",
  "price": 64900,
  "review_count": 10,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 836,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1558577384660_b.jpg/1700/1700",
  "product": 164
  }
  ]
  },
  {
  "id": 176,
  "brand_name": "쁘리엘르펫",
  "name": "댕댕이 관절보호 강아지계단 2/3층",
  "discount_rate": "60",
  "price": 7900,
  "review_count": 40,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 885,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1560144217160_CLm3Qrf.jpg/1700/1700",
  "product": 176
  }
  ]
  },
  {
  "id": 175,
  "brand_name": "그레이독",
  "name": "강아지/고양이 접이식욕조 폴딩텁 2colors",
  "discount_rate": "55",
  "price": 17900,
  "review_count": 10,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 881,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1542085943768_MZZRG7Vp84.jpg/1700/1700",
  "product": 175
  }
  ]
  },
  {
  "id": 171,
  "brand_name": "고양이",
  "name": "전국냥냥자랑 (고양이 모아보기)",
  "discount_rate": "",
  "price": 2000,
  "review_count": 40,
  "star_avg": "4.58",
  "thumnail_images": [
  {
  "id": 863,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1546843967477_vS2.jpg/1700/1700",
  "product": 171
  }
  ]
  },
  {
  "id": 166,
  "brand_name": "페슬러",
  "name": "1+1 스펀지 배변패드 (소형/두툼형/대형)",
  "discount_rate": "30",
  "price": 13900,
  "review_count": 45,
  "star_avg": "4.56",
  "thumnail_images": [
  {
  "id": 843,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1537249209106_qBZQZWR.jpg/1700/1700",
  "product": 166
  }
  ]
  },
  {
  "id": 163,
  "brand_name": "세븐펫",
  "name": "강아지 미끄럼방지 도톰매트 10P",
  "discount_rate": "50",
  "price": 15900,
  "review_count": 50,
  "star_avg": "4.54",
  "thumnail_images": [
  {
  "id": 831,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1536640866303_mY3kffcIO.jpg/1700/1700",
  "product": 163
  }
  ]
  },
  {
  "id": 178,
  "brand_name": "마이독",
  "name": "고양이 원목 캣타워",
  "discount_rate": "4",
  "price": 41900,
  "review_count": 25,
  "star_avg": "4.48",
  "thumnail_images": [
  {
  "id": 899,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1545813188917_leWVHF.jpg/1700/1700",
  "product": 178
  }
  ]
  },
  {
  "id": 172,
  "brand_name": "그레이독",
  "name": "고양이 윈도우해먹",
  "discount_rate": "40",
  "price": 17900,
  "review_count": 25,
  "star_avg": "4.48",
  "thumnail_images": [
  {
  "id": 867,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1542344586266_qDbp.jpg/1700/1700",
  "product": 172
  }
  ]
  },
  {
  "id": 165,
  "brand_name": "대리석아빠",
  "name": "10시간 지속! 시원한 강아지/고양이 대리석 쿨매트 2size",
  "discount_rate": "33",
  "price": 30000,
  "review_count": 30,
  "star_avg": "4.47",
  "thumnail_images": [
  {
  "id": 839,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-156163360612737085.jpg/1700/1700",
  "product": 165
  }
  ]
  }
  ],
  "furniture": [
  {
  "id": 31,
  "brand_name": "로제까사",
  "name": "국민 에펠체어 7colors",
  "discount_rate": "56",
  "price": 19800,
  "review_count": 30,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 253,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1488247220037_5y7nt.jpg/1700/1700",
  "product": 31
  }
  ]
  },
  {
  "id": 28,
  "brand_name": "오홀리브",
  "name": "액자테이블 BEST 50종 택1",
  "discount_rate": "34",
  "price": 16900,
  "review_count": 25,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 231,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1506408468701_j.jpg/1700/1700",
  "product": 28
  }
  ]
  },
  {
  "id": 23,
  "brand_name": "리샘",
  "name": "스완 수납 화장대 2colors",
  "discount_rate": "58",
  "price": 69900,
  "review_count": 10,
  "star_avg": "4.60",
  "thumnail_images": [
  {
  "id": 211,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1535346871119_B.jpg/1700/1700",
  "product": 23
  }
  ]
  },
  {
  "id": 32,
  "brand_name": "마켓비",
  "name": "BRUG 스탠드 행거 3colors",
  "discount_rate": "35",
  "price": 12900,
  "review_count": 35,
  "star_avg": "4.57",
  "thumnail_images": [
  {
  "id": 261,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1501035778987_gfy.jpg/1700/1700",
  "product": 32
  }
  ]
  },
  {
  "id": 21,
  "brand_name": "한샘",
  "name": "[7%쿠폰] [기간한정] 재크 철제 미니 수납장 양문형 (3종/택1)",
  "discount_rate": "49",
  "price": 29900,
  "review_count": 30,
  "star_avg": "4.57",
  "thumnail_images": [
  {
  "id": 200,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-156271820945523910.jpg/1700/1700",
  "product": 21
  }
  ]
  },
  {
  "id": 36,
  "brand_name": "리샘",
  "name": "캐더린 LED 수납침대 슈퍼싱글(SS)/퀸(Q)",
  "discount_rate": "29",
  "price": 159000,
  "review_count": 40,
  "star_avg": "4.55",
  "thumnail_images": [
  {
  "id": 279,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1560155152674_EwQw.jpg/1700/1700",
  "product": 36
  }
  ]
  },
  {
  "id": 19,
  "brand_name": "아이와비",
  "name": "카페 패브릭 접이식 소파베드 3colors",
  "discount_rate": "44",
  "price": 89000,
  "review_count": 15,
  "star_avg": "4.53",
  "thumnail_images": [
  {
  "id": 195,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1549384435034_ELc1O.jpg/1700/1700",
  "product": 19
  }
  ]
  },
  {
  "id": 22,
  "brand_name": "로제까사",
  "name": "KUBO 철제 책상",
  "discount_rate": "16",
  "price": 44900,
  "review_count": 20,
  "star_avg": "4.50",
  "thumnail_images": [
  {
  "id": 205,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1542725984761_UW8.jpg/1700/1700",
  "product": 22
  }
  ]
  },
  {
  "id": 27,
  "brand_name": "먼데이하우스",
  "name": "LEITER 철제 선반 3type 6colors",
  "discount_rate": "54",
  "price": 16100,
  "review_count": 30,
  "star_avg": "4.50",
  "thumnail_images": [
  {
  "id": 224,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1529414013647_Pw5OMMi.jpg/1700/1700",
  "product": 27
  }
  ]
  },
  {
  "id": 29,
  "brand_name": "마켓비",
  "name": "[할인쿠폰] FIHA 철제 서랍장 5종 7colors",
  "discount_rate": "15",
  "price": 33900,
  "review_count": 20,
  "star_avg": "4.50",
  "thumnail_images": [
  {
  "id": 239,
  "image": "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1559294769371_zTq.jpg/1700/1700",
  "product": 29
  }
  ]
  }
  ]
}
""".data(using: .utf8)!
