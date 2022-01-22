FROM selenium/standalone-chrome:latest

RUN sudo apt-get update
RUN sudo apt-get install -y python3-pip
RUN pip3 install selenium
RUN pip3 install Image
