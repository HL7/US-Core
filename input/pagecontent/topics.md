
### Subscription Topics

US core defines these two subscription topics that all conformant US Core
servers SHALL provide support for. That is, clients can create subscriptions
that refer to these two topics by their URL as shown below. Accordingly:

* Conformant servers SHALL list these two topics in their capability statement using the [[[url]]] extension
* Conformant servers SHALL accept clients referencing these topics in their Subscription.criteria element, though they may apply business rules before allowing the subscriptions

Conformant servers are not required to host the topics on their server at all,
or to allow clients to create or update the topics they support, though they 
can choose to do so if they desire. Note that if they do, the RESTful end-point
on which topics are maintained is a separate end-point that uses FHIR R5, and is 
not further constrained or profiled by US Core.

### US Core data

This subscription topic provides access to all changes to data covered by US CDI.
Any changes to resources available on the system (to the user who created the 
subscription) flow through this topic.

Defining URL: ```http://hl7.org/fhir/us/core/SubscriptionTopic/uscdi```

This is a mighty firehose of data; servers that support this title are likely to 
require subscriptions to filter the topic in subscriptions that are linked to this
topic to keep the overall load on the server down.

This topic is also available as a [formal definition](SubscriptionTopic-uscdi.html) (in R5 format - see note above).

#### Terminology support 

todo: ...?

### Patient Identity Changes

This topic is used whenever there are fundamental changes to a patient's identity 
on the server. Note that a change to a patient identifier is *not* a change to 
patient identity - that's handled through the US core data above. What is covered 
are:

* linking or unlinking patient records 
* merging patient records 

This topic will be called twice, once for each affected record.

Defining URL: ```todo```


todo: formal definition