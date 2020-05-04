# Experiência Criativa - Projeto II
Este projeto foi feito para a Pontifícia Universidade Católica do Paraná (PUCPR) como o segundo projeto da matéria Experiência Criativa, do primeiro período. Neste projeto foi utilizado o IDE Processing e a linguágem Java para construir uma central multimídia simples.

Autor: Alan Renato Bunese (Alanzote)

# Versão do Processing
Certifique-se que você está rodando pelo menos o Processing 4.0a1.

# Biblioteca Video
Infelizmente, esta biblioteca está com problemas de compatibilidade com o Processing 4.0a1, então é necessário baixar pelo menos a versão 2.0-beta4 do Processing Video em https://github.com/processing/processing-video/releases. O extração do Zip deve ser feita na pasta `Processing/libraries`, que se encontra nos seus Documentos de usuário. Caso você já tenha uma pasta `video` dentro desta pasta `libraries`, faça um backup dela caso você utilize outra versão não alpha do Processing para quando você foi utilizar esta versão antiga, você possa trocar para a versão antiga da biblioteca facilmente.

# Arquivo Principal
O arquivo principal é MMC.pde.

# Abrindo um Arquivo
Quando a aplicação estiver inicializada, clique em File -> Open para abrir um arquivo de multimídia.
São aceitos:
* Vídeo
* Áudio
* Imagem

## Arquivos de Vídeo
Quando um arquivo de vídeo foi carregado corretamente, uma linha do tempo irá aparecer embaixo. Nela tem as principais funcionalidades para o vídeo.

## Arquivos de Áudio
Ao carregar um arquivo de audio, as principais funcionalidades são monstradas em uma barra de controle embaixo. No meio, os níveis da música são apresentados.

## Arquivos de Imagem
Arquivos de imagem não possuem controles, ao contrário de Áudio e Vídeo. Entretanto, você pode arrastar a a imagem para mudar ela de posição na tela, além disso, usar a roda do mouse altera o zoom na imagem.