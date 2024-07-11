# Classe représentant une case du plateau de jeu
class BoardCase
    attr_accessor :value # valeur de la case : "X", "O" ou nil
  
    def initialize(value = nil)
      @value = value
    end
  
    def empty? # retourne vrai si la case est vide
      @value.nil?
    end
  end
  
  # Classe représentant le plateau de jeu
  class Board
    attr_reader :cases # tableau des cases du plateau
  
    def initialize
      @cases = Array.new(9, BoardCase.new) # crée un tableau de 9 cases vides
    end
  
    def display # affiche le plateau dans le terminal
      puts "-------------"
      (0..2).each do |i|
        print "| "
        (0..2).each do |j|
          case = @cases[i*3 + j]
          print case.value.to_s || " " # affiche la valeur de la case ou un espace si elle est vide
          print " | "
        end
        puts
        puts "-------------"
      end
    end
  
    def play(player, position) # joue un coup pour le joueur donné à la position donnée
      @cases[position-1].value = player.symbol
    end
  
    def victory? # retourne vrai si un joueur a gagné
      winning_combinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
      winning_combinations.any? do |combination|
        values = combination.map { |index| @cases[index].value }
        values.all? { |value| value == "X" } || values.all? { |value| value == "O" }
      end
    end
  
    def full? # retourne vrai si le plateau est plein
      @cases.all? { |case| !case.empty? }
    end
  end
  
  # Classe représentant un joueur
  class Player
    attr_reader :name, :symbol # nom et symbole du joueur : "X" ou "O"
  
    def initialize(name, symbol)
      @name = name
      @symbol = symbol
    end
  end
  
  # Classe représentant le jeu
  class Game
    attr_reader :board, :current_player # plateau de jeu et joueur courant
  
    def initialize
      @players = [Player.new("Joueur 1", "X"), Player.new("Joueur 2", "O")] # crée les deux joueurs
      @board = Board.new # crée le plateau de jeu
      @current_player = @players[0] # définit le joueur courant comme le premier joueur
    end
  
    def switch_player # change de joueur courant
      @current_player = @current_player == @players[0] ? @players[1] : @players[0]
    end
  
    def play # joue une partie
      system "clear" # efface le terminal
      @board.display # affiche le plateau de jeu
      until @board.victory? || @board.full? # boucle jusqu'à ce qu'un joueur ait gagné ou que le plateau soit plein
        print "Joueur #{@current_player.name}, choisissez une case (1-9) : "
        position = gets.chomp.to_i
        if position.between?(1,9) && @board.cases[position-1].empty?
          @board.play(@current_player, position) # joue le coup
          switch_player # change de joueur
          system "clear" # efface le terminal
          @board.display # affiche le plateau de jeu
        else
          puts "Case invalide ou déjà jouée. Veuillez réessayer."
        end
      end
      if @board.victory?
        puts "#{@current_player.name} a gagné !"
      else
        puts "Match nul."
      end
    end
  end
  
  # Lancement du jeu
  game = Game.new
  game.play
  