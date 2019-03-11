BRANCH=$1
export CXX=g++
export CC=gcc

apt-get update
apt-get -y install g++ cmake autoconf libtool libssl-dev libcurl4-openssl-dev parallel \
                   libboost-test-dev libboost-system-dev libboost-chrono-dev libboost-thread-dev \
                   libboost-iostreams-dev libboost-date-time-dev libboost-coroutine-dev \
                   libboost-filesystem-dev libboost-program-options-dev \
                   libboost-context-dev libboost-regex-dev \
                    
cd /usr/local/src/
rm -rd bitshares-core
git clone https://github.com/bitshares/bitshares-core.git
cd bitshares-core
git checkout $BRANCH
git submodule update --init --recursive
cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo .
time make -j$(nproc) witness_node cli_wallet

mkdir -p $HOME/build/$BRANCH
mv /usr/local/src/bitshares-core/programs/witness_node/witness_node $HOME/build/$BRANCH
mv /usr/local/src/bitshares-core/programs/cli_wallet/cli_wallet $HOME/build/$BRANCH

ls -l $HOME/build/$BRANCH
