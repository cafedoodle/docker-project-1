#The purpose of a docker file is to specify the instructions for building a docker image.
#The syntax of a docker file is fairly straightforward.
#Comments begin with a hash or a pound sign.
#Then you have an instruction followed by the arguments.
#INSTRUCTION arguments

# Use an official Python runtime as the base image
#FROM python:3.12-trixie
FROM python:3.12-rc-bookworm
#The name of the image is Python, and everything following the colon is the image tag.
#In this example, the tag includes both the version and operating system.
#FROM baseImage

#The first thing we need is a from command.
#The purpose of this command is to use an official Python runtime as the base image. So our argument is Python, and then the runtime version.
#This command tells docker what base image to use.
#Your base image should contain the tools needed to run your application.
#In this case, we're using Python, but there are also base images for different operating systems, such as Windows or Linux.

#Docker maintains a list of images and versions available, which you can find@hub.docker.com. 

#
# Set the working directory in the container to /app
WORKDIR /app
#WORKDIR /the/workdir/path
#Next, we need to set the working directory in the container to the app directory.
#This is the default directory for our Flask app.
#The instruction for this is WORKDIR, and the argument is /app.

#
# Copy the current directory contents into the container at /app
COPY . /app
#COPY source dest
#Our next instruction will copy the current directory contents into the container at /app.
#The instruction is copy, and here we have two arguments.
#We need to specify the current directory, which is the route directory, so we'll enter a period.
#And then, we need to specify the folder within the container where we want to copy our project files, which is the app folder.

#
# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt
#RUN command
#Now we need to install the required packages needed to run our application. To do this, we'll use the run instruction.
#The arguments include the pip install command to install the required Python packages.
#The no cash dir flag tells pip not to store the downloaded packages in the cache directory.
#And the required packages are defined in the requirements.txt file.

#
# Set the environment variable for Flask
ENV FLASK_APP=app.py
#ENV key=value
#Next, we will set the environment variable for Flask. The instruction is ENV, and the arguments are Flask app equals app.py.
#This sets the Flask app environment variable to app.py, which is the name of the Flask application. 

# Add labels to the image
# LABEL Formatting Option 1
LABEL "com.example.vendor"="Big Star Collectibles"
LABEL version="1.0"
LABEL description="The Big Star Collectibles Website \
using the Python base image."

# LABEL Formatting Option 2
# LABEL "com.example.vendor"="Big Star Collectibles" version="1.0" description="The Big Star Collectibles Website \
# using the Python base image."

# LABEL Formatting Option 3
# LABEL "com.example.vendor"="Big Star Collectibles" \
# version="1.0" \
# description="The Big Star Collectibles Website \
# using the Python base image."

#
# Run the command to start the Flask application
CMD ["flask", "run", "--host=0.0.0.0"]
#CMD [ "executable" ]
#And the final instruction is CMD, which is the command the container executes by default when you launch the built image.
#In our case, it's Flask, run, and the host flag equal to 0.0.0.0.
#A docker file will only use the final command defined, so you have to be careful when you're building your docker files so that you don't overwrite your default command.