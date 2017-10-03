## Kaggle titanic challenge

#### Stahnout kaggle image
~~~
docker pull kaggle/python
~~~

#### Nebo vytvorit vlastni image nad nim
~~~
docker build -t my-kaggle/python .
~~~

#### Vytvorit container
~~~
docker run --name kaggle-python -h kaggle-python -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME:/host_home -it my-kaggle/python
~~~

#### Nastartovat container, pokud stoji
~~~
docker container start kaggle-python
~~~

#### Pustit okno v bezicim containeru s bashem
~~~
docker exec kaggle-python -it /bin/bash
~~~

#### Pustit Pycharm s protunelovanyma Xkama
~~~
/host_home/path/to/pycharm/bin/pycharm.sh  > /dev/null 2>&1 &
~~~
