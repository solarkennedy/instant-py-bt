test:
	bash -xc "./test.py &  ./py-bt "`pgrep -f test.py`"; fg"
