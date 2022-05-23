**Show Chats**
----
  Returns json data about all chats of an application.

* **URL**

  /api/v1/chat_applications/:token/chats

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**
 
     None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `[
    {
        "number": "1",
    },
    {
        "number": "2"
    }
]`
 
_________________
 
 
 **Show Chat**
----
  Returns json data about a single chat.

* **URL**

  /api/v1/chat_applications/:token/chats/:number

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**
 
    `number=[integer]`


* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `[
    {
        "number": "1",
    }
]`

* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "Chat doesn't exist" }`

_________________


 **Create Chat**
----
  Create a new chat.

* **URL**

  /api/v1/chat_applications/:token/

* **Method:**

  `POST`
  
*  **URL Params**

   **Required:**
 
    None


* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `[
    {
        "number": "1"
    }
]`

* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "Chat application doesn't exist" }`




