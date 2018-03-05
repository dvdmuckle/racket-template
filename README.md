# racket-template

OpenFaaS template for developing functions based on the Racket environment.

To find out more about the OpenFaaS templates see the [faas-cli](https://github.com/openfaas/faas-cli).

> Note: This template is completely customizable - so if you want to alter it please do fork it and use `faas template pull` to make use of your updated versions.

To utilize this template, edit the handler.rkt file, adding any necessary function deffinitions. The top level function `handle` will be executed whenever the deployed function is invoked. Input can be read from `stdin`, and any output should be printed to `stdout`. Note that there are four templates, two for armhf, two for amd64. The `full` templates trade in greater image size for faster function execution. If you find your functions taking a long time to execute, consider using the `full` template to speed up execution. The `full` templates use `raco make` to compile the functions into bytecode to speed up execution. You can read more about how `raco make` works [here](https://docs.racket-lang.org/raco/make.html).

The current version of OpenFaaS templates use the original `watchdog` which `forks` processes - a bit like CGI. The newer watchdog [of-watchdog](https://github.com/openfaas-incubator/of-watchdog) is more similar to fastCGI/HTTP and should be used for any benchmarking or performance testing along with one of the newer templates. Contact the project for more information.
