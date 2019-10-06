build:
	@docker build . -t test
run:
	@docker -eAUTOMATION=0 -it test /bin/bash

