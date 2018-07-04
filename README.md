Dicionário de Libras para Mac
=================
<img src="preview.png" width="350"/>


Instalação
---
1. [Baixe o arquivo .zip do dicionário](https://github.com/thiagofelix/DicionarioLibras/releases/download/v1.0/Libras.dictionary.zip)
2. Extraia o arquivo .dictionary de dentro do arquivo .zip
3. Copie o arquivo .dictionary para a pasta de dicionários do seu Mac.

Para mais informações veja este vídeo no Youtube para aprender instalar um dicionário novo no seu computador
https://youtu.be/PCm_AVa-XTg

Desenvolvimento
---

**Build rápido**
```
curl -k -L https://github.com/thiagofelix/DicionarioLibras/raw/master/go.sh | sh
```
***Bibliotecas necessárias***
* jq 
  [`brew install jq`]
* json2xml
  [`npm install json2xml json2xml-cli -g`]

**Build passo a passo**
```
git clone https://github.com/thiagofelix/DicionarioLibras.git
cd DicionarioLibras
make install
```


Divirta-se

