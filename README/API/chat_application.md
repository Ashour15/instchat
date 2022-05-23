**Show Chat Applications**
----
  Returns json data about all chat applications.

* **URL**

  /api/v1/chat_applications

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**
 
     None

* **Data Params**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `[
    {
        "name": "First application",
        "token": "kyuxoK3zyHJBtwB2iTLz5V1g",
        "chats_count": 0,
        "created_at": "2022-05-21T19:15:28.000Z",
        "updated_at": "2022-05-21T19:15:28.000Z"
    },
    {
        "name": "Second application",
        "token": "zJ16hhUns4Deroy6DurxM4KE",
        "chats_count": 0,
        "created_at": "2022-05-21T23:48:04.000Z",
        "updated_at": "2022-05-21T23:48:04.000Z"
    }
]`
 
_________________
 
 
 **Show Chat Application**
----
  Returns json data about a single chat applications.

* **URL**

  /api/v1/chat_applications/:token

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**
 
    `token=[string]`


* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `[
    {
        "name": "First application",
        "token": "kyuxoK3zyHJBtwB2iTLz5V1g",
        "chats_count": 0,
        "created_at": "2022-05-21T19:15:28.000Z",
        "updated_at": "2022-05-21T19:15:28.000Z"
    }
]`

* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "Chat application doesn't exist" }`

_________________


 **Create a Chat Application**
----
  Create a new chat application.

* **URL**

  /api/v1/chat_applications

* **Method:**

  `POST`
  
*  **URL Params**

   **Required:**
 
    `[chat_application]name=[string]`


* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `[
    {
        "name": "First application",
        "token": "kyuxoK3zyHJBtwB2iTLz5V1g",
        "chats_count": 0,
        "created_at": "2022-05-21T19:15:28.000Z",
        "updated_at": "2022-05-21T19:15:28.000Z"
    }
]`

_________________

 **Update a Chat Application**
----
  Updates a single chat application.

* **URL**

  /api/v1/chat_applications/:token

* **Method:**

  `PUT`
  
*  **URL Params**
    `[chat_application]name=[string]`

   **Required:**
 
    `token=[string]`


* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `[
    {
        "name": "First application new name",
        "token": "kyuxoK3zyHJBtwB2iTLz5V1g",
        "chats_count": 0,
        "created_at": "2022-05-21T19:15:28.000Z",
        "updated_at": "2022-05-21T19:15:28.000Z"
    }
]`

* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "Chat application doesn't exist" }`

_________________

 **Delete a Chat Application**
----
  Delete a single chat application.

* **URL**

  /api/v1/chat_applications/:token

* **Method:**

  `DELETE`
  
*  **URL Params**

   **Required:**
 
    `token=[string]`


* **Success Response:**

  * **Code:** 204 <br />
    **Content:** 

* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "Chat application doesn't exist" }`



