# Java Spark vs Go Goji

This project is a simple benchmark and comparison of the Java Spark Framework
and the Go Goji framework. I am hoping to compare these two frame works on a
couple of different parameters such as resource consumption, average response
times, concurrent requests, etc. As well as lines of code, ease of use, etc.

The reasoning behind this endeavor? I have a few projects that are coming up
both at work and personally that I had planned to use Go for. However, with my
recent discovery of the Spark framework, I am interested to see how the two
compare. I would like to put some concrete evidence behind my decision, as well
as to just be better informed myself.

I know this is an odd comparison as it mostly boils down to the differences in
the language, but I am hoping to compare these two frameworks as I feel that
they are similar in their level of simplicity and ease of use.


## The Test Subjects

I will be writing up a very basic microservice in both frameworks. The
microservice will have two endpoints:

 - /status - This will return a predefined JSON status message
 - /echo/:phrase - This will return a JSON including the phrase that was passed
 in

The reason to have the different endpoints is that I would like to compare not
only the reponse speed for a pre determined message, but I would also like to
compare the speed of being able to route and access path parameters in the
microservice.

The different code can be found in their respective folders (go and java).

## Results

Nothing to see here quite yet ;)


## Contributing

I am more than happy to accept contributions to this project. Feel free to open
issues or pull requests for any adjustments or additions that you think should
be included in the project. 
