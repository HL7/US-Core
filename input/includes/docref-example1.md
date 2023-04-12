
<!-- includes/docref-example1.md -->
<!-- Example 1 : Request the latest CCD -->

**Request the latest CCD for a patient using `GET` syntax**

`GET [base]/DocumentReference/$docref?patient=123`

**Request the latest CCD for a patient using `POST` syntax**

`POST [base]/DocumentReference/$docref}`

**POST request body:**

~~~
    {
      "resourceType": "Parameters",
      "id": "get-ccd123",
      "parameter": [
        {
          "name": "patient",
          "valueId" : "123"
        }
      ]
    }
~~~

**Response**

~~~
HTTP/1.1 200 OK
[other headers]
~~~

**Response body**

~~~

{% include_relative Bundle-docref-example-1.json %}

~~~
