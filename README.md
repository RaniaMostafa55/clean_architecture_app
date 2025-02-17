# My App

A Very Good Project created by Very Good CLI applying clean architecture and viewing some products data.

This project is dividing features into three layers:

## Data layer which includes:
	- "data source" which detects the source of data like api, local..etc (in our case, data comes from api)
 	- "models" which detects the shape of incoming data
  	- "repositories" which deals with data source to get data from

## Domain layer which includes:
	- "entities" represent the main components of the data without any implementation details.
 	- "repositories" in the domain Layer define abstract contracts with data layer, ensuring that the business logic remains independent of specific data sources
  	- "usecases" which defines the business logic and how data flows between the domain and other layers

## Presentation layer
	- "cubit" which contains 
 		- "product_states" to define the different states of the incoming data like (ProductLoading,ProductLoaded..etc)
   		- "product_cubit" to call the use cases and emit the appropriate states
    - "view" which contains the UI which differs according to the emitted state to view the incoming products data
      
Note that in "core", you will find "injection" and "failures" files which are commonly used in all the app
