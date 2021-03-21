FROM python:3.6.12-slim-buster

RUN apt-get update
RUN apt install -y wget htop bash tree

# pin specific versions of Jupyter and Tornado dependency
RUN pip install notebook==5.7.10
RUN pip install tornado==4.5.3

# install the package
RUN pip install graph-notebook

# install and enable the visualization widget
RUN jupyter nbextension install --py --sys-prefix graph_notebook.widgets
RUN jupyter nbextension enable  --py --sys-prefix graph_notebook.widgets

# copy static html resources
RUN python -m graph_notebook.static_resources.install
RUN python -m graph_notebook.nbextensions.install

# copy premade starter notebooks
RUN python -m graph_notebook.notebooks.install --destination /notebooks

# check premade starter notebooks
RUN tree /notebooks --dirsfirst