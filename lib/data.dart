var customers = [
  {
    "index": 0,
    "isDeleted": false,
    "balance": 7384531,
    "picture": "http://placehold.it/32x32",
    "name": "Mona Evans",
    "gender": "female",
    "email": "monaevans@ronelon.com",
    "phone": "+1 (923) 553-3131",
    "address": "232 Lancaster Avenue, Gorst, Hawaii, 495",
    "registered": "2017-01-10 01:35:04",
    "birthdate": "2015-09-01"
  },
  {
    "index": 1,
    "isDeleted": false,
    "balance": 5387488,
    "picture": "http://placehold.it/32x32",
    "name": "Harding Ruiz",
    "gender": "male",
    "email": "hardingruiz@ronelon.com",
    "phone": "+1 (903) 600-2750",
    "address": "750 Adler Place, Takilma, New Mexico, 9342",
    "registered": "2016-03-16 08:57:28",
    "birthdate": "2012-04-03"
  },
  {
    "index": 2,
    "isDeleted": false,
    "balance": 3877913,
    "picture": "http://placehold.it/32x32",
    "name": "Montgomery Norman",
    "gender": "male",
    "email": "montgomerynorman@ronelon.com",
    "phone": "+1 (948) 422-3586",
    "address": "842 Monument Walk, Witmer, Illinois, 1137",
    "registered": "2020-06-28 04:44:27",
    "birthdate": "1992-01-09"
  },
  {
    "index": 3,
    "isDeleted": true,
    "balance": 2119770,
    "picture": "http://placehold.it/32x32",
    "name": "Collins Walters",
    "gender": "male",
    "email": "collinswalters@ronelon.com",
    "phone": "+1 (945) 511-2778",
    "address": "265 Cambridge Place, Somerset, Kansas, 8642",
    "registered": "2015-04-19 10:08:44",
    "birthdate": "2014-08-17"
  },
  {
    "index": 4,
    "isDeleted": false,
    "balance": 8368351,
    "picture": "http://placehold.it/32x32",
    "name": "Holcomb Hull",
    "gender": "male",
    "email": "holcombhull@ronelon.com",
    "phone": "+1 (813) 508-2901",
    "address":
        "729 Banker Street, Franklin, Federated States Of Micronesia, 2787",
    "registered": "2016-12-15 09:15:06",
    "birthdate": "2001-01-13"
  },
  {
    "index": 5,
    "isDeleted": false,
    "balance": 5923453,
    "picture": "http://placehold.it/32x32",
    "name": "Santos Walter",
    "gender": "male",
    "email": "santoswalter@ronelon.com",
    "phone": "+1 (857) 418-2101",
    "address": "320 Vanderveer Street, Deltaville, New York, 4327",
    "registered": "2021-11-22 07:54:47",
    "birthdate": "1999-11-29"
  }
];

var tables = [
  {"index": 0, "isDeleted": false, "noTable": 1, "isAvailable": false},
  {"index": 1, "isDeleted": false, "noTable": 2, "isAvailable": true},
  {"index": 2, "isDeleted": false, "noTable": 3, "isAvailable": false},
  {"index": 3, "isDeleted": false, "noTable": 4, "isAvailable": false},
  {"index": 4, "isDeleted": false, "noTable": 5, "isAvailable": false},
  {"index": 5, "isDeleted": false, "noTable": 6, "isAvailable": false},
  {"index": 6, "isDeleted": false, "noTable": 7, "isAvailable": false},
  {"index": 7, "isDeleted": false, "noTable": 8, "isAvailable": true},
  {"index": 8, "isDeleted": false, "noTable": 9, "isAvailable": false},
  {"index": 9, "isDeleted": false, "noTable": 10, "isAvailable": true},
  {"index": 10, "isDeleted": true, "noTable": 11, "isAvailable": false},
  {"index": 11, "isDeleted": false, "noTable": 12, "isAvailable": false},
  {"index": 12, "isDeleted": false, "noTable": 13, "isAvailable": false},
  {"index": 13, "isDeleted": true, "noTable": 14, "isAvailable": false}
];

var hotMenu = [
  {
    "title": "Salmon Salad",
    "description": "Salmon salad packed with fresh salmon.",
    "price": 70000,
    "image": "salmonsalad.png"
  },
  {
    "title": "Fried Chicken Lemon",
    "description": "Grizzly dazzly Fried Chicken with Lemon.",
    "price": 150000,
    "image": "friedchicken.png"
  },
  {
    "title": "Meat Sausage",
    "description": "Extra cooked meat sausage.",
    "price": 350000,
    "image": "meatsausage.png"
  },
  {
    "title": "Curry Seafood",
    "description": "Curry comes with seafood recipe.",
    "price": 44000,
    "image": "curry_seafood.png"
  },
];

var foods = [
  {
    "id": 1,
    "title": "Salmon Salad",
    "description": "Salmon salad packed with fresh salmon.",
    "price": 70000,
    "image": "salmonsalad.png",
    "category": ["Seafood", "Eastern", "Vegetarian"],
    "imageThumbnail": [
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png"
    ],
  },
  {
    "id": 2,
    "title": "Ichiyaku Ramen Special",
    "description": "Delicious yummy ramen with umami taste of broth.",
    "price": 149000,
    "image": "ramen.png",
    "category": ["Seafood", "Eastern", "Meat"],
    "imageThumbnail": [
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png"
    ],
  },
  {
    "id": 3,
    "title": "Fried Chicken Lemon",
    "description": "Grizzly dazzly Fried Chicken with Lemon.",
    "price": 150000,
    "image": "friedchicken.png",
    "category": ["Seafood", "Eastern", "Meat"],
    "imageThumbnail": [
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png"
    ],
  },
  {
    "id": 4,
    "title": "Meat Sausage",
    "description": "Extra cooked meat sausage.",
    "price": 350000,
    "image": "meatsausage.png",
    "category": ["Western", "Meat"],
    "imageThumbnail": [
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png"
    ],
  },
  {
    "id": 5,
    "title": "Curry Seafood",
    "description": "Curry comes with seafood recipe.",
    "price": 44000,
    "image": "curry_seafood.png",
    "category": ["Seafood", "Meat"],
    "imageThumbnail": [
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png"
    ],
  },
  {
    "id": 6,
    "title": "Fermented Mozzarella Cheese",
    "description": "Delicious yummy mozzarella.",
    "price": 382000,
    "image": "mozzarella_cheese.png",
    "category": ["Western", "Cheese"],
    "imageThumbnail": [
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png"
    ],
  },
  {
    "id": 7,
    "title": "Smoked Pork",
    "description": "Smoked delicious pork.",
    "price": 112000,
    "image": "smoked_pork.png",
    "category": ["Western", "Meat", "Pork"],
    "imageThumbnail": [
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png"
    ],
  },
  {
    "id": 8,
    "title": "Sausage",
    "description": "Classic traditional sausage with veggies.",
    "price": 67000,
    "image": "sausage.png",
    "category": ["Western", "Meat", "Pork"],
    "imageThumbnail": [
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png"
    ],
  },
  {
    "id": 9,
    "title": "Veggie Bean",
    "description": "Classic veggie with bean with truffle oil.",
    "price": 97000,
    "image": "veggie_bean.png",
    "category": ["Western", "Vegetarian"],
    "imageThumbnail": [
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png"
    ],
  },
  {
    "id": 10,
    "title": "Salad Fruit",
    "description": "Signature salad fruit from Michellin's 5 star.",
    "price": 117000,
    "image": "salad_fruit.png",
    "category": ["Western", "Vegetarian"],
    "imageThumbnail": [
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png"
    ],
  },
  {
    "id": 11,
    "title": "Fish",
    "description": "Who doesn't like fish in a stick.",
    "price": 39000,
    "image": "fish_tusk.png",
    "category": ["Western", "Meat", "Seafood"],
    "imageThumbnail": [
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png"
    ],
  },
  {
    "id": 12,
    "title": "Campina's Fried Rice",
    "description":
        "Campina's signature delicious fried rice with truffle sauce.",
    "price": 392000,
    "image": "fried_rice.png",
    "category": ["Eastern", "Meat", "Vegetarian"],
    "imageThumbnail": [
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png",
      "salmonsalad.png"
    ],
  }
];

var todayPromo = [
  {
    "title": "Salmon Salad",
    "description": "Salmon salad packed with fresh salmon.",
    "price": 70000,
    "discounted": 40000,
    "image": "salmonsalad.png"
  },
  {
    "title": "Fried Chicken Lemon",
    "description": "Grizzly dazzly Fried Chicken with Lemon.",
    "price": 150000,
    "discounted": 100000,
    "image": "friedchicken.png"
  },
  {
    "title": "Meat Sausage",
    "description": "Extra cooked meat sausage.",
    "price": 350000,
    "discounted": 250000,
    "image": "meatsausage.png"
  },
];

var foodCategories = [
  "Eastern",
  "Western",
  "Soup",
  "Spicy",
  "Sweet",
  "Cheese",
  "Vegan",
  "Meat",
];

var cart = [
  {"food_id": 1, "qty": 2, "price": 70000.00, "subtotal": 140000.00},
  {"food_id": 2, "qty": 4, "price": 149000.00, "subtotal": 596000.00},
];

var discount = "";
