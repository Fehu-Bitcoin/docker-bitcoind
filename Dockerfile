FROM ubuntu:22.04

RUN apt-get update \
	&& apt-get install -y nano wget
	
RUN wget https://bitcoincore.org/bin/bitcoin-core-26.0/bitcoin-26.0-x86_64-linux-gnu.tar.gz
RUN tar xf bitcoin-26.0-x86_64-linux-gnu.tar.gz
RUN cp -vr bitcoin-26.0/bin/bitcoind /usr/local/bin/
RUN cp -vr bitcoin-26.0/bin/bitcoin-cli /usr/local/bin/

CMD bitcoind --daemon && tail -f /root/.bitcoin/debug.log