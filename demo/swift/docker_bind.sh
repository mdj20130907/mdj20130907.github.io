docker run \
--mount type=bind,source=`pwd`,destination=/root/develop/ \
--workdir /root/develop \
--privileged \
--interactive --tty \
--name my-swift \
swift \
/bin/bash
