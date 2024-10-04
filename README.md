# my_first_flutter_app

My first flutter app

To install home brew 

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew --version

install JAVA

brew install openjdk

sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

ls -la /Library/Java/JavaVirtualMachines

nano ~/.zshrc

source ~/.zshrc

java -version

add to z

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export JAVA_HOME=$(/usr/libexec/java_home)

keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"


To add pub via CLI 

flutter pub add (pub name)

To make iOS system adopt pubs -> 

run - sudo gem pristine json --version 1.8.6

add export LANG=en_US.UTF-8 into either of below

~/.profile or ~/.bash_profile or nano ~/.zshrc

then run source  source ~/.profile   or ~/.bash_profile or ~/.zshrc 

run  sudo gem uninstall cocoapods

run sudo gem install cocoapods

After addressing the above issues, navigate to your Flutter project's ios directory and run

pod install

flutter clean

flutter run

To create splash: flutter pub run flutter_native_splash:create --path=splash.yaml
To remove added splash : flutter pub run flutter_native_splash:remove



Firebase CLI

use npm -> install
Open Terminal
sudo npm install -g firebase-tools

(installation of firebase using node js completed)

firebase login

to Install and run the FlutterFire CLI

dart pub global activate flutterfire_cli

add environment variables:
export LANG=en_US.UTF-8
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/Users/saneforce/.pub-cache/bin:$PATH"

source ~/.zshrc

switch to your current project

cd /Users/saneforce/Desktop/Flutter

flutterfire configure

add android app id and continue

For authentication Android requires SHA1  fingerprint 

To do so navigate to project settings in firebase -> naavigate to android app -> Add finderprint 

To add new SHA1 fingerprint => ~/.android/debug.keystore -> 

keytool -list -v -keystore /Users/saneforce/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
