# GoToPOM-

![GoToPOM　都道府県☆](https://user-images.githubusercontent.com/82147921/196339010-7c5c0e1e-4516-43e4-9d0a-0d8b3879c5c2.gif)


## OverView

HotPepper APIと位置情報を使った飲食店のガチャアプリです  
ガチャで出てきたお店の情報はGoogle検索、またはSNSへのシェア機能を使うことができます

## Requirement

・macOS Monterey 12.5.1

・Xcode 14.0.1

・swift 5

### ・ライブラリ

・CoreLocation

・UIKit

・Alamofire

・SwiftyJSON

・SDWebImage 5.11.1

・BubbleTransition

・lottie-ios

### ・API

・HotPepper API

## Usage

検索したい場所とお店のジャンルを選ぶと  
該当のお店をランダムで表示します  
表示されたお店の情報は「店舗詳細」を押すことでGoogle検索できます  
また、「シェア」を押すことでSNSへのシェアも可能です  

検索したい場所に関しては最初の画面の「近くのお店から」を押すことで  
現在地から近くのお店を指定することができます

## Features

・飲食店のデータ取得機能(Alamofire,SwiftyJSON,API)

・位置情報取得機能(CoreLocation)

・ガチャ機能

・lottie-iosによるアニメーション

・シェア機能

・WebKitでのWebView表示

・Userdefaultによるデータ保存・取得機能

## Reference

・ホットペッパーAPIリファレンス  
https://webservice.recruit.co.jp/doc/hotpepper/reference.html

・[初心者向け]iOSアプリ開発　ガチャアプリ  
https://qiita.com/kakecyanman/items/ffa68b43cc5c43a0fa71

・その他、Qiita,StackOverView,ios-docs等のサイトを参考にしました。

## 補足

これからデータベースを使ったお気に入り機能や簡易的なチャットルーム機能なども追加していきたいなと思っています



