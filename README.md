![Express.js](https://img.shields.io/badge/express.js-%23404d59.svg?style=for-the-badge&logo=express&logoColor=%2361DAFB) ![NodeJS](https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white) ![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white) ![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)

# Atelier Products API

This is a node/express application that provides a REST API for the Atelier ecommerce frontend.

The database schema is located in `/PostgreSQL`

The node server is located in  `/server` and enters on `index.js`

## Install

Prep Database, required files `answers.csv`, `photos.csv`, `questions.csv`.

```
npm install
```

copy `example.env` to `.env` and configure the variables within.

## Run the App

```
npm start
```

# API Endpoints

All Queries take parameters as Query strings unless it is in the endpoint\
All responses should return status code `200 OK`

### `GET /qa/questions`
Retrieves a list of questions for a particular product.

#### Parameters
| Parameter | Type    | Description                                               |
|-----------|---------|-----------------------------------------------------------|
|product_id	| Integer	|Specifies the product for which to retrieve questions.     |
|page	      | Integer	|Selects the page of results to return. Default 1.          |
|count	    | Integer	|Specifies how many results per page to return. Default 5.  |



#### Response
```json
{
  "product_id": "5",
  "results": [{
        "question_id": 37,
        "question_body": "Why is this product cheaper here than other sites?",
        "question_date": "2018-10-18T00:00:00.000Z",
        "asker_name": "williamsmith",
        "question_helpfulness": 4,
        "reported": false,
        "answers": {
          68: {
            "id": 68,
            "body": "We are selling it here without any markup from the middleman!",
            "date": "2018-08-18T00:00:00.000Z",
            "answerer_name": "Seller",
            "helpfulness": 4,
            "photos": []
            // ...
          }
        }
      },
      {
        "question_id": 38,
        "question_body": "How long does it last?",
        "question_date": "2019-06-28T00:00:00.000Z",
        "asker_name": "funnygirl",
        "question_helpfulness": 2,
        "reported": false,
        "answers": {
          70: {
            "id": 70,
            "body": "Some of the seams started splitting the first time I wore it!",
            "date": "2019-11-28T00:00:00.000Z",
            "answerer_name": "sillyguy",
            "helpfulness": 6,
            "photos": [],
          },
          78: {
            "id": 78,
            "body": "9 lives",
            "date": "2019-11-12T00:00:00.000Z",
            "answerer_name": "iluvdogz",
            "helpfulness": 31,
            "photos": [],
          }
        }
      },
      // ...
  ]
}
```

### `GET /qa/questions/:question_id/answers`
Returns answers for a given question.

#### Parameters
| Parameter  | Type    | Description                                             |
|------------|---------|---------------------------------------------------------|
| question_id| Integer | Required ID of the question for wich answers are needed |

#### Query Parameters

|Parameter |	Type	|Description                                              |
|----------|--------|---------------------------------------------------------|
|page	     |Integer	|Selects the page of results to return. Default 1.        |
|count	   |Integer	|Specifies how many results per page to return. Default 5.|

#### Response
```json
{
  "question": "1",
  "page": 0,
  "count": 5,
  "results": [
    {
      "answer_id": 8,
      "body": "What a great question!",
      "date": "2018-01-04T00:00:00.000Z",
      "answerer_name": "metslover",
      "helpfulness": 8,
      "photos": [],
    },
    {
      "answer_id": 5,
      "body": "Something pretty durable but I can't be sure",
      "date": "2018-01-04T00:00:00.000Z",
      "answerer_name": "metslover",
      "helpfulness": 5,
      "photos": [{
          "id": 1,
          "url": "urlplaceholder/answer_5_photo_number_1.jpg"
        },
        {
          "id": 2,
          "url": "urlplaceholder/answer_5_photo_number_2.jpg"
        },
        // ...
      ]
    },
    // ...
  ]
}
```

### `POST /qa/questions`
Adds a question for the given product

#### Body Parameters
| Parameter  | Type    | Description                                               |
|------------|---------|-----------------------------------------------------------|
|body	       |text	   |Text of question being asked                               |
|name	       |text	   |Username for question asker                                |
|email	     |text	   |Email address for question asker                           |
|product_id	 |integer	 |Required ID of the Product for which the question is posted|



### `POST /qa/questions/:question_id/answers`
Adds an answer for the given question

#### Parameters
| Parameter  | Type    | Description                                        |
|------------|---------|----------------------------------------------------|
| question_id| Integer | Required ID of the question to post the answer for.|

#### Body Parameters
| Parameter  | Type    | Description                                        |
|------------|---------|----------------------------------------------------|
|body	       |text   	 |Text of question being asked                        |
|name	       |text	   |Username for question asker                         |
|email	     |text   	 |Email address for question asker                    |
|photos	     |[text] 	 |An array of urls corresponding to images to display |

#### Response
```
Status: 201 CREATED
```

### `PUT /qa/questions/:question_id/helpful`
Updates a question to show it was found helpful.

#### Parameters
| Parameter  | Type    | Description                                        |
|------------|---------|----------------------------------------------------|
|question_id |integer  |	Required ID of the question to update             |

#### Response
```
Status: 204 NO CONTENT
```

### `PUT /qa/answers/:answer_id/helpful`
Updates a answer to show it was found helpful.

#### Parameters
| Parameter  | Type    | Description                                        |
|------------|---------|----------------------------------------------------|
|asnwer_id   |integer  |	Required ID of the answer to update               |

#### Response
```
Status: 204 NO CONTENT
```

### `PUT /qa/answers/:answer_id/report`
Updates an answer to show it has been reported.

#### Parameters
| Parameter  | Type    | Description                                        |
|------------|---------|----------------------------------------------------|
|answer_id   |integer  |	Required ID of the answer to update               |

#### Response
```
Status: 204 CREATED
```

### `PUT /qa/questions/:question_id/report`
Updates an answer to show it has been reported.

#### Parameters
| Parameter  | Type    | Description                                        |
|------------|---------|----------------------------------------------------|
|question_id |integer  |	Required ID of the question to update             |

#### Response
```
Status: 204 CREATED
```