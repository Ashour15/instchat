**Show Messages**
----
  Returns json data about all messages of a chat.

* **URL**

  /api/v1/chat_applications/:token/chats/:number/messages

* **Method:**

  `GET`
  
*  **URL Params**
To return results that partially match the written query string
  `query=[string]

   **Required:**
 
     None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `[
    {
        "number": "1",
        "body": "Hi, how are you?"
    },
    {
        "number": "2",
        "body": "Hi, how are you?"
    }
]`


* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "Chat application doesn't exist" }`

  OR

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "Chat doesn't exist" }``
 
_________________
 
 
 **Show Message**
----
  Returns json data about a single message.

* **URL**

  /api/v1/chat_applications/:token/chats/:number/messages/:message_number

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**
 
    `message_number=[integer]`


* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `[
    {
        "number": "1",
        "body": "Hi, how are you?"
    }
]`

* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "Chat application doesn't exist" }`

  OR

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "Chat doesn't exist" }``

_________________


 **Create Message**
----
  Create a new message.

* **URL**

  /api/v1/chat_applications/:token/chats/:number/messages

* **Method:**

  `POST`
  
*  **URL Params**

   **Required:**
 
    `[message]body=[string]`


* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `[
    {
        "number": "1",
        "body": "Hi, how are you?"
    }
]`

* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "Chat application doesn't exist" }`

  OR

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "Chat doesn't exist" }``




