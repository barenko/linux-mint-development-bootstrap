#!/bin/bash
echo "Installing Java..."

asdf plugin add java

echo "    zulu-11.43... a less resource expensive JVM"
asdf install java zulu-11.43.55
asdf global java zulu-11.43.55
java -version
export JAVA_HOME=$(asdf where java)

echo "    gradle... the less worst build tool available for java"
asdf plugin add gradle
asdf install gradle 6.8
asdf global gradle 6.8
gradle -v

