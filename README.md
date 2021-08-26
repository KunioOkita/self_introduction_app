# self_introduction_app
自己紹介Webアプリ

## installation

### PostgreSQL on docker

```
docker-compose up -d
```

[How to use this image]:https://hub.docker.com/_/postgres

### library for Debian

- gcc
- g++
- libpg
- make
```
sudo apt-get install gcc g++ make libpq-dev
```

### Node.js use nvm

```bash
$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
$ source ~/.bashrc 
$ nvm install --lts
$ npm install --global yarn
$ yarn add webpack webpack-cli
```

### ruby

```bash
$ git clone git://github.com/sstephenson/rbenv.git .rbenv
$ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
$ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
$ source .bash_profile 
$ git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
$ rbenv install 2.6.6
$ rbenv global 2.6.6
```

### rails

```bash
$ gem install rails
```

### application

```bash
$ git checkout https://github.com/KunioOkita/self_introduction_app.git
$ cd self_introduction_app
$ bundle install
$ bin/rails webpacker:install
$ bin/rails db:create
$ bin/rails db:migrate
# for debug
$ rake db:seed
```
