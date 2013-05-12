dd if=/dev/zero of=$2 bs=4608 count=1
dd if=$1stage1/stage1 of=$2 bs=512 count=1 conv=notrunc
dd if=$1stage2/stage2 of=$2 bs=512 seek=1 conv=notrunc
