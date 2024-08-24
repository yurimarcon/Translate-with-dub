
## Passo a passo de como gerenciar versões do python
https://www.freecodecamp.org/portuguese/news/como-gerenciar-diversas-versoes-do-python-e-ambientes-virtuais/\#:\~:text\=pyenv%20procura%20em%20quatro%20lugares,sua%20sess%C3%A3o%20de%20shell%20atual.


## Comando para remover audio do vídeo
ffmpeg -i PATH_TO_YOUR_INPUT_VIDEO.mp4 -ab 160k -ac 2 -ar 44100 -vn PATH_TO_YOUR_OUTPUT_AUDIO.wav

## Passo a passo para traduzir o vídeo com lipsync
https://medium.com/@contactbp22/video-video-translation-with-lip-sync-e83f627a1f8


## Tarefas:

[x] Separar audio do video.
[x] Extrair transcrição traduzida.
[x] Colocar o audio com a transcrição em cima do vídeo.

# Como rodar o projeto

Basta rodar o comando:

```sh
./robot.sh <caminho-do-video-de-input>
```

Os arquivos serão gerados dentro do diretório "result/" na raiz do projeto.