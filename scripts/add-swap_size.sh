SWAP_SIZE=$1

fallocate -l $SWAP_SIZE'g' /$SWAP_SIZE'GiB.swap'
chmod 600 /$SWAP_SIZE'GiB.swap'
mkswap /$SWAP_SIZE'GiB.swap'
swapon /$SWAP_SIZE'GiB.swap'
echo '/'$SWAP_SIZE'GiB.swap swap swap defaults 0 0' | tee -a /etc/fstab
