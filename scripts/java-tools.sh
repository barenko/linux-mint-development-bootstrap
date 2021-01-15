echo "Installing the java tools..."

asdf plugin install java
asdf install java zulu-11.43.55
asdf global java zulu-11.43.55
java -version

asdf plugin add gradle
asdf install gradle 6.8
asdf global gradle 6.8
gradle -v


sudo snap install intellij-idea-community --classic
cp /var/lib/snapd/desktop/applications/intellij-idea-community_intellij-idea-community.desktop ~/.local/share/applications/


