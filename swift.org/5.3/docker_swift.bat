docker run ^
--mount type=bind,source=%cd%,destination=/root/develop/ ^
--workdir /root/develop ^
--privileged ^
--interactive --tty ^
--name swift-5.3 ^
swift:5.3 ^
/bin/bash
