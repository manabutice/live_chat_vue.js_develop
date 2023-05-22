# README

#参考資料
Ruby on RailsプロジェクトをAPIモードで新規作成

https://github.com/mtoyopet/live-chat-rails/tree/2-1

認証機能を実装しよう

https://github.com/mtoyopet/live-chat-rails/tree/2-2

$ bundle install --path vendor/bundle

❗️注意❗️
この方法でRuby on Railsプロジェクトを作成した際は、rails routesやrails serverなどのrailsコマンドを実行する際にbundle execをコマンドの前に追加し実行する必要があります。よって、rails routesは
bundle exec rails routes 
rails serverは
bundle exec rails server
と実行します。ネットの記事にはrails routesとしか書いてない場合がほとんどなので、bundle execを追加して実行するようにしてください。