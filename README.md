# blenderpy
 
pythonでblenderを動かせるようにするやつ

* ubuntu-20.04
* Python-3.9.1
* Blender-2.93
 
# Note
 dockerfileの実行にすごく時間かかるんで，気をつけてください
 （自分で試したときは，3時間弱）

# dockerfile
 
dockerfileの実行(イメージの作成)
 
```bash
docker build -t [イメージ名] .
```

コンテナ起動

```bash
docker run -it -d --name [コンテナ名] [イメージID] /bin/bash
```

# Decimate.py
objファイルの読み込み→頂点数削減→objファイルの出力
をします

* decimate_ratio　頂点数削減の比率
* input_path　　　入力するobjファイルのpath
* output_path    出力するobjファイルのpath

obj以外にも，fbx，gltf，x3dは使えます．
https://docs.blender.org/api/current/bpy.ops.import_scene.html
