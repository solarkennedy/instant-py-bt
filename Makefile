test: py27 py36
	bash -xc './py27-py-bt-itest.py & P=$$! ; ./py-bt $$P; kill $$P'
	bash -xc './py36-py-bt-itest.py & P=$$! ; ./py-bt $$P; kill $$P'
	bash -xc 'py27/bin/python ./py27-py-bt-itest.py & P=$$! ; ./py-bt $$P; kill $$P'
	bash -xc 'py36/bin/python ./py36-py-bt-itest.py & P=$$! ; ./py-bt $$P; kill $$P'

py27:
	virtualenv -p python2.7 py27

py36:
	virtualenv -p python2.7 py36
