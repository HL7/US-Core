
<!-- includes/docref-example2 -->
<!-- Example 2: Request Procedure Notes and Discharge Summaries for 2019 -->


**Request Procedure Notes and Discharge Summaries for 2019 using `POST` syntax**

`POST [base]/DocumentReference/$docref}`

**POST request body:**

~~~
{
    "resourceType": "Parameters",
    "id": "get-docs",
    "parameter": [
        {
            "name": "patient",
            "valueId": "123"
        },
        {
            "name": "start",
            "valueDateTime": "2019-01-01"
        },
        {
            "name": "end",
            "valueDateTime": "2019-12-31"
        },
        {
            "name": "type",
            "valueCoding": {
                "system": "http://terminology.hl7.org/CodeSystem/c80-doc-typecodes",
                "code": "18842-5",
                "display": "Discharge summary"
            }
        },
        {
            "name": "type",
            "valueCoding": {
                "system": "http://terminology.hl7.org/CodeSystem/c80-doc-typecodes",
                "code": "28570-0",
                "display": "Procedures Note"
            }
        },
        {
            "name": "on-demand",
            "valueBoolean": true
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

{% include_relative Bundle-docref-example-2.json %}

~~~
