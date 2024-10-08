FROM python:3.11-slim
ARG VERSION

RUN apt-get update && apt-get -y install git libglib2.0-0

# Needed for lrelease if plugin is using a transifex token
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install qttools5-dev-tools
RUN pip install --upgrade pip
RUN pip install qgis-plugin-ci==$VERSION
# RUN pip install git+https://github.com/Gustry/qgis-plugin-ci.git
# COPY /home/etienne/dev/python/qgis-plugin-ci /qgis-plugin-ci
# RUN pip install /qgis-plugin-ci

COPY gitconfig /etc/gitconfig
CMD ["bash"]
