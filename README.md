# self_introduction_app
自己紹介Webアプリ

## installation for development

### library for Debian

```
sudo apt-get install git gcc g++ make libpq-dev curl bzip2 libssl-dev libreadline-dev zlib1g-dev
```

### PostgreSQL on docker

```
docker-compose up -d
```

[How to use this image]:https://hub.docker.com/_/postgres

### Node.js use nvm

```bash
$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
$ source ~/.bashrc 
$ nvm install --lts
$ npm install --global yarn
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
$ git clone https://github.com/KunioOkita/self_introduction_app.git
$ cd self_introduction_app
$ yarn add webpack webpack-cli
$ bundle install
$ bin/rails webpacker:install
$ bin/rails db:create
$ bin/rails db:migrate
# for debug
$ rake db:seed
```

## Deploy to GAE 

### 事前に確認しておくこと

- cloud-sqlで作成したDB名, ユーザ名, パスワード, 接続情報
- xxxxxxxx@cloudbuild.gserviceaccount.com のサービスアカウントの権限
- AD

### サービスアカウントへの権限付与

```bash
gcloud projects add-iam-policy-binding <Project ID> \
--member=serviceAccount:xxxxxxxxxxxx@cloudbuild.gserviceaccount.com \
--role=roles/editor
```

### credentials の設定

```bash
EDITOR="vi" bin/rails credentials:edit
```

以下の内容を追記

```yml
db:
  database: <DB Name>※
  username: <User Name>※
  userpass: <User Pass>※
  host: <Connect>※
```
※環境に応じて置き換える
※Connectは "/cloudsql/<接続名>"

### gae deploy

```bash
gcloud app deploy
```

### db migrate

```bash
bundle exec rake appengine:exec -- bundle exec rake db:migrate
```

## Deploy GCE

### posrgres

```bash
docker-compose -f docker-compose.yml.postgres up -d
```

### enviroment

環境に併せて修正

```bash
# Azure Oauth
export AZURE_APP_ID=xx
export AZURE_APP_SECRET=xx
export AZURE_SCOPES="openid profile email offline_access user.read mailboxsettings.read calendars.readwrite"
# Google Cloud Storage
export GCS_PROJECT=xx
export GCS_BUCKET=xx
# Database
export RAILS_DATABASE_NAME=xx
export RAILS_DATABASE_USERNAME=xx
export RAILS_DATABASE_USERPASSWORD=xx
export RAILS_DATABASE_HOST=xx
export RAILS_ENV=production
```

### DB

```bash
bin/rails db:create
bin/rails db:migrate
```