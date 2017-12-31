#!/bin/bash
docker run -it --privileged -v `pwd`:/work/:ro $1 /work/itest.sh python
