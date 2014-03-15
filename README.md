SAOContextMenu 1.0

======================
アニメ「ソードアート・オンライン」(SAO)内に登場するVRMMORPG「ソードアート・オンライン」ゲーム内で使われているメニューUIを、ios用のコンテキストメニューとして再現してみました。
完全に同じものになると何らかの権利に抵触する恐れがあるため、ある程度簡略化して汎用的なメニューとしてデザインし作成してあります。

※初めての公開になりますので、いたらない点が多々あるかもしれませんが、よかったらお試し頂き、もっとこうした方が良いなどありましたら、フィードバックいただけるとありがたいです。

 
使い方
------
ADTViewControllerを参照

メニューに設定できる要素として、テキスト（NSString）とアイコン画像（UIImage）のどちらかを１つ指定できるようになってます。
また、テキストは全角３文字以内がもっとも美しく表示される長さになりますので、３文字に収まらない場合は、アイコン画像を指定される事をお勧めします。
また、iPhoneの縦横のサイズの都合に対応するため、オリジナルでは縦メニューですが、横方向に並べたメニューも表示できるようになってます。
よって、iPhoneのPortrait時は横メニューを使い、それ以外は縦メニューとして利用されるの事をお勧めします。

 
パラメータの解説
----------------
ADTViewControllerを参照
 
 
関連情報
--------
twitter  
https://twitter.com/zzramt

ブログ  
http://zzram.blog97.fc2.com/

サンプルイメージ
----------------
縦メニュー

![Image](https://dl.dropboxusercontent.com/u/48819432/images_github/sao_contextimage_h_s.jpg)

横メニュー

![Image](https://dl.dropboxusercontent.com/u/48819432/images_github/sao_contextimage_v_s.jpg)
 
ライセンス
----------
The MIT License (MIT)
Copyright (c) 2014 Silver Frontier
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
