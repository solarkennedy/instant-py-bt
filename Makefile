test: py27 py36
	./itest.sh /usr/bin/python2.7
	./itest.sh /usr/bin/python3.6
	./itest.sh py27/bin/python
	./itest.sh py36/bin/python

docker-itest:
	./docker-itest.sh ubuntu:14:04

py27:
	virtualenv -p python2.7 py27

py36:
	virtualenv -p python2.7 py36
