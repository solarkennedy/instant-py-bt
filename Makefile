test:
#	bash -xc './py27-py-bt-itest.py & P=$$! ; ./py-bt $$P; kill $$P'
	bash -xc './py36-py-bt-itest.py & P=$$! ; ./py-bt $$P; kill $$P'
