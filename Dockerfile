FROM alpine:edge
RUN apk update; apk upgrade; apk add --no-cache clang git make cmake alpine-sdk
RUN git clone https://github.com/oktal/pistache.git; \
  cd pistache; git submodule update --init; \
  mkdir build; cd build; \
  cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ..; \
  make; sudo make install;
RUN git clone https://github.com/jarro2783/cxxopts.git; \
  cd cxxopts; mkdir build; cd build; \
  cmake -DCMAKE_BUILD_TYPE=Release ..; \
  make; sudo make install;
EXPOSE 9080
