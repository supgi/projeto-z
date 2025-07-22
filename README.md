# Projeto-Z

Um jogo 2D desenvolvido na Godot Engine.

### Sobre

Pequeno projeto colaborativo feito em parceria com a comunidade

### Estrutura das Pastas

📂 - res://  
├ 📂 - Assets - Imagens, sons, musica e outros recursos do jogo  
├ 📂 - Objects - Node's que interagem ou possuem interações  
├ 📂 - Scenes - Cenarios e/ou grupos de Node's  
├ 📂 - Scripts  
├ ├ 📂 - Classes - Node's customizado e classes  
├ └ 📂 - Globals - Scripts globais  
├ 📂 - Scenes - Cenarios e/ou grupos de Node's  
└ 📂 - Test (Opcional) - Pasta destinada a teste que não vão para a versão final  

### Camadas de Colisão (Collision Layers)

Para gerenciar as interações físicas no jogo, as seguintes camadas de colisão são utilizadas:

- **Layer 1**: Jogador
- **Layer 2**: Inimigo
- **Layer 5**: Paredes e outros elementos estáticos do cenário

### Como baixar

Baixe o arquivo zip, faça um fork ou clone com o seguinte comando:

`git clone https://github.com/supgi/projeto-z.git`

### Como Executar

1.  Certifique-se de ter a [Godot Engine](https://godotengine.org/) (versão 4.x ou superior) instalada.
2.  Clone ou baixe este repositório.
3.  Abra o gerenciador de projetos da Godot, clique em "Importar" e selecione o arquivo `project.godot` na raiz deste projeto.
4.  Com o projeto aberto, pressione `F5` para executá-lo.