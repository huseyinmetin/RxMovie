
# Welcome to RxMovie Project!

RxMovie application is an application that you can follow your favourite series and movies.

## Libraries
- [RxSwift](https://github.com/ReactiveX/RxSwift)

### Why RxSwift?
RxSwift is a library that you can manage observable process.

## Design Pattern

- **MVVM**
ssss
#### Folder  Structure
	- ViewController
		- ExampleViewController
			- View
				- ExampleViewContoller.swift and if exists .xib files
			- ViewModel
				- ExampleViewModel.swift
	- View
		- Storyboard files
	- Model
		- Contains model classes or structs file
	- API
		- Contains Web API or Web socket class files
	- Extension
		- if exists contains extension files
	- Contains custom class that assume particular works

## API
### Get Popular
#### GET   /tv/popular
Get a list of the current popular TV shows on TMDb. This list updates daily.

	Popular Model
		page: Int
    	total_results: Int
    	total_pages: Int
    	results: [PopularItem]
    
  	PopularItem Model
		original_name: String
    	genre_ids: [Int]
    	name: String
    	popularity: Double
    	origin_country: [String]
    	vote_count: Int?
    	first_air_date: Date
    	backdrop_path: String
    	original_language: String
    	id: Int
    	vote_average: Double
    	overview: String
    	poster_path: String


# Thanks