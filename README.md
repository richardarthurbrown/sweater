# SWEATER

A small application for weather recommendations.

# USAGE

Start the project by calling `iex -S mix` from the command line.

Uses ExOWM to interact with the OpenWeatherMap API. 

To call the API, you will need to have your API key set as an environment variable.

`export OWM_API_KEY={your api key}`

 To use the application, start the project by entering the project directory in your terminal.
 `cd ~/your_directory/sweater`
 
 Then, type `iex -S mix` and call the main function with `Sweater.get_weather("your city here")`.
 
 For example, `Sweater.get_weather("Oklahoma City")`.
 
 # Wrap-Up

Overall I found this to be a fun little challenge, and I am pleased with the overall direction I took.

One assumption I made about the project was that an external library to handle the actual API logic would be the best way to proceed in the spirit of "putting together a quick test system to verify some assumptions about our API" that the challenge posed. I think it would have been interesting to directly call the OWM API using HTTPoison or another library, but that seemed outside the scope of the prompt.

If I were to go back and change something in the future about this, however, it would be to either find or implement a way to add a Behaviour to the external API call to ease testing and allow more robust mocks to verify against. As it stands I had to rely on pretty open-ended tests because of the implementation I used, which I am not 100% satisfied with.

I also would have liked to implement a more robust way of parsing input to get more granular recommendations, such as allowing the user to input a time window or handling more than one location at a time. 

