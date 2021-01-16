echo "Installing Java..."

asdf plugin install java

echo "    zulu-11.43... a less resource expensive JVM"
asdf install java zulu-11.43.55
asdf global java zulu-11.43.55
java -version

echo "    gradle... the less worst build tool available for java"
asdf plugin add gradle
asdf install gradle 6.8
asdf global gradle 6.8
gradle -v

echo "    idea... the best java IDE available, but it can drain your resources as like chrome does"
sudo snap install intellij-idea-community --classic
cp /var/lib/snapd/desktop/applications/intellij-idea-community_intellij-idea-community.desktop ~/.local/share/applications/


