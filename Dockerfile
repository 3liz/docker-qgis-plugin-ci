FROM python:3.9-slim
ARG VERSION

RUN apt-get update && apt-get -y install git libglib2.0-0

# Needed for lrelease if plugin is using a transifex token
RUN apt-get -y install qt5-default qttools5-dev-tools

RUN pip install qgis-plugin-ci==$VERSION
# RUN pip install git+https://github.com/Gustry/qgis-plugin-ci.git
# COPY /home/etienne/dev/python/qgis-plugin-ci /qgis-plugin-ci
# RUN pip install /qgis-plugin-ci

COPY gitconfig /etc/gitconfig

ENTRYPOINT ["qgis-plugin-ci"]
