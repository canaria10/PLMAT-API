FROM nginx:1.11.13
RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y build-essential

# Copy source files
WORKDIR /home/plmat_api
ADD ./ .

#Following step is for React project.
RUN chmod 755 wait-for-it.sh
RUN npm install
RUN npm install -g pm2
CMD ./wait-for-it.sh  ${DB_SERVER} -t 60 -- npm run start:production

