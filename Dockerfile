FROM ruby:2.6.3-stretch as ruby
FROM gcr.io/distroless/base

# Enable Debugging
# FROM gcr.io/distroless/base:debug
# WORKDIR /opt

COPY --from=ruby /lib/x86_64-linux-gnu/libz.so.* /lib/x86_64-linux-gnu/
COPY --from=ruby /usr/lib/x86_64-linux-gnu/libyaml* /usr/lib/x86_64-linux-gnu/
COPY --from=ruby /usr/local/lib/ /usr/local/lib
COPY --from=ruby /usr/local/bin/ /usr/local/bin

COPY --from=ruby /usr/lib/x86_64-linux-gnu/libgmp* /usr/lib/x86_64-linux-gnu/

CMD ["/usr/local/bin/ruby", "-v"]
