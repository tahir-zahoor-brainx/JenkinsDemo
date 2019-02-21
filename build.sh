#!/bin/bash

# input params
branchName=$1
buildType=$2
storePass=$3
keyAlias=$4
keyPass=$5

# clean project
chmod +x gradlew
./gradlew clean --stacktrace

# build
if [ $buildType = 'debug' ]; then
	./gradlew assembleDebug --stacktrace
elif [ $buildType = 'release' ]; then
	./gradlew assembleRelease --stacktrace
fi

# -----------------------------------------------------------------
# -------------------------- TESTS & LINT--------------------------
# -----------------------------------------------------------------
# lint
./gradlew lint

# run junit test
if [ $buildType = 'debug' ]; then
    ./gradlew testDebugUnitTest --stacktrace
elif [ $buildType = 'release' ]; then
    ./gradlew testReleaseUnitTest --stacktrace
fi



cat << "EOF"

             ,
         (`.  : \               __..----..__
          `.`.| |:          _,-':::''' '  `:`-._
            `.:\||       _,':::::'         `::::`-.
              \\`|    _,':::::::'     `:.     `':::`.
               ;` `-''  `::::::.                  `::\
            ,-'      .::'  `:::::.         `::..    `:\
          ,' /_) -.            `::.           `:.     |
        ,'.:     `    `:.        `:.     .::.          \
   __,-'   ___,..-''-.  `:.        `.   /::::.         |
  |):'_,--'           `.    `::..       |::::::.      ::\
   `-'                 |`--.:_::::|_____\::::::::.__  ::|
                       |   _/|::::|      \::::::|::/\  :|
                       /:./  |:::/        \__:::):/  \  :\
                     ,'::'  /:::|        ,'::::/_/    `. ``-.__
                    ''''   (//|/\      ,';':,-'         `-.__  `'--..__
                                                             `''---::::'

EOF