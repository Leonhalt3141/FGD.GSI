
!!!構成!!!
./Converted => 変換した基盤地図情報を格納
./Data => 基盤地図情報のxmlファイル格納
./Scripts => 各種スクリプト
  |
  |__KibanConvert.sh => 基盤地図情報のxmlファイルをShapefileに変換
  |                     （ftype変数を変更することで、他のフォーマットも可能）
  |
  |__KibanMerge.sh => 変換後のファイルを結合
  
  
  !!!ファイル変換方法!!!
  cd Scripts
  sh KibanConvert.sh
  
  !!!ファイル結合方法!!!
  cd Scripts
  sh KibanMerge.sh
