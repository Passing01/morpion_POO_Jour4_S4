                         Explication du Code

Ce code définit quatre classes : BoardCase, Board, Player et Game.

La classe BoardCase représente une case du plateau de jeu. Elle a un attribut accessible en écriture et en lecture, "value", qui peut prendre les valeurs "X", "O" ou nil (si la case est vide). La méthode "empty?" renvoie vrai si la case est vide (c'est-à-dire si @value est nil).

La classe Board représente le plateau de jeu. Elle a un attribut en lecture seule, "cases", qui est un tableau de neuf cases vides (des instances de BoardCase). La méthode "display" affiche le plateau dans le terminal. La méthode "play" prend en paramètre un joueur et une position, et joue un coup pour le joueur donné à la position donnée en mettant à jour la valeur de la case correspondante. La méthode "victory?" renvoie vrai si un joueur a gagné, c'est-à-dire s'il y a trois cases alignées (horizontale, verticale ou diagonale) avec la même valeur ("X" ou "O"). La méthode "full?" renvoie vrai si le plateau est plein, c'est-à-dire si toutes les cases sont occupées.

La classe Player représente un joueur. Elle a deux attributs en lecture seule, "name" et "symbol", qui représentent respectivement le nom et le symbole du joueur ("X" ou "O").

La classe Game représente le jeu. Elle a deux attributs en lecture seule, "board" et "current\_player", qui représentent respectivement le plateau de jeu et le joueur courant. La méthode "switch\_player" change le joueur courant en passant au joueur suivant. La méthode "play" joue une partie en bouclant jusqu'à ce qu'un joueur ait gagné ou que le plateau soit plein. À chaque tour, elle demande au joueur courant de choisir une case, vérifie que la case est valide et pas déjà jouée, joue le coup, change de joueur, efface le terminal et affiche le plateau de jeu. Si un joueur a gagné, elle affiche son nom suivi de "a gagné !". Si le plateau est plein et qu'il n'y a pas de gagnant, elle affiche "Match nul."

Enfin, le code crée une nouvelle instance de Game et appelle la méthode "play" pour lancer le jeu.

                     Comment faire pour executer le code

Ouvrez un terminal et naviguez jusqu'au répertoire où se trouve le fichier tic_tac_toe.rb. Vous pouvez alors exécuter le programme en tapant la commande suivante :


ruby tic_tac_toe.rb

Le programme devrait alors démarrer et afficher le plateau de jeu vide. Les joueurs peuvent alors entrer leurs coups en saisissant la position verticale (A, B ou C) suivie de la position horizontale (1, 2 ou 3), par exemple "A1" pour la case en haut à gauche.

Le programme continuera de demander aux joueurs de saisir leurs coups jusqu'à ce qu'un joueur gagne ou que le plateau soit rempli. À la fin de la partie, le programme demandera aux joueurs s'ils veulent jouer une nouvelle partie.