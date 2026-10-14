FROM node:lts-slim

RUN npm i -g @marp-team/marp-cli @marp-team/marp-core highlight.js

WORKDIR /opt/zeek-marp

COPY *.css .
COPY marp marp
COPY --chmod=755 marp-zeek.sh .
RUN ln -s $(pwd)/marp-zeek.sh /usr/local/bin/marp-zeek.sh

ENV NODE_PATH=/usr/local/lib/node_modules
USER node
WORKDIR /home/node

# The base image drops into Node
CMD ["/bin/bash"]
