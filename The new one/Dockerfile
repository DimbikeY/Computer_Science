FROM ubuntu:18.04
MAINTAINER dimonelas@mail.ru
ENV NZ=Europe/Moscow
RUN apt-get update
RUN apt-get install -y apache2
EXPOSE 80 

RUN echo "<html> <head>   <title> I love Docker! </title> </head> <body>  <p> Hello world! I'm DMITRII DOLMATOV and I study at ITMO University! </p> </body> </html>" > /var/www/html/index.html
