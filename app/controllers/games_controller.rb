class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]

  # GET /games or /games.json
  def index
    @games = Game.all
  end

  # GET /games/1 or /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end


  def gameDetails
    game = Game.find(params[:id])
    chess_game = Chess::Game.load_fen(game.fen)

    @game_id = game.id
    @game_status = chess_game.status.to_s.tr('_', ' ')
    @white_player = Player.find(game.player_white_id)
    @black_player = Player.find(game.player_black_id)


    starting_fen = game.fen
    split_fen = starting_fen.split(' ')
    fen_positions = split_fen[0].split('/')
    positions = Array.new(8)
    current_row = 0
    for row in fen_positions
      positions[current_row] = Array.new(8)
      current_field = 0
      char_index = 0
      while current_field < 8
        field = row[char_index]
        if Integer(field, exception: false)
          iterator = field.to_i
          while iterator > 0
            positions[current_row][current_field] = " "
            current_field += 1
            iterator -= 1
          end
        else
          positions[current_row][current_field] = field
          current_field += 1
        end
        char_index += 1
      end
      current_row += 1
    end

    if split_fen[1] == 'b'
      @whoMoves = 'black'
    else
      @whoMoves = 'white'

    end
    @positions = positions
  end

  def makeMove
    game = Game.find(params[:game_id])
    chess_game = Chess::Game.load_fen(game.fen)
    begin
      chess_game.move(params[:movement])
      flash[:error] = nil
      game.fen = chess_game.current.to_fen
      if chess_game.over?
        game.end_date = Date.today.strftime("%e %b %Y")
      end
      game.save
      redirect_to game_details_path(game.id)
    rescue Chess::BadNotationError => e
      flash[:error] = e.message
      redirect_to game_details_path(game.id)
    rescue Chess::IllegalMoveError => e
      flash[:error] = e.message
      redirect_to game_details_path(game.id)
    end

  end

  def newGame
    players = Player.where.not(id: current_player.id)
    @players_list = Array.new(players.count)
    counter = 0
    for player in players
      @players_list[counter] = Array.new(2)
      @players_list[counter][0] = player.username
      @players_list[counter][1] = player.id
      counter += 1
    end
  end

  def addGame
    opponent_id = params[:player_field]
    chess_game = Chess::Game.new
    game = Game.new
    game.fen = chess_game.current.to_fen
    game.start_date = Date.today.strftime("%e %b %Y")
    game.status = chess_game.status.to_s.tr('_', ' ')
    game.who_moves = 'white'
    if params[:player_color] == "White"
      game.player_white_id = current_player.id
      game.player_black_id = opponent_id
    else
      game.player_white_id = opponent_id
      game.player_black_id = current_player.id
    end

    game.save
    redirect_to mainpage_path(current_player.id)
  end

  def analyze
      game = Game.find(params[:game_id])
      fen = game.fen
      engine_api = EngineApi.new('lip_xyQvHxD9Nd7M6MWyRWti')
      analysis = engine_api.analyze_position(fen)

      if analysis
        flash[:analysis_error] = nil
        json_object = JSON.parse(analysis)
        variants_array = Array.new(json_object['pvs'].count)
        json_object["pvs"].each_with_index do |key, index|
          variants_array[index] = Array.new(2)

          variants_array[index][0] = format_moves(game.who_moves, key['moves'])
          variants_array[index][1] = key['cp']
        end
        flash[:variants] = variants_array
        redirect_to game_details_path(params[:game_id])
      else
        flash[:analysis_error] = 'Unable to analyze the position'
        flash[:variants] = nil
        redirect_to game_details_path(params[:game_id])
      end
  end
  # POST /games or /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to game_url(@game), notice: "Game was successfully created." }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to game_url(@game), notice: "Game was successfully updated." }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end



  def playerGames
    @id = params[:id]
    @games = Game.where(:player_white_id == @id).or(Game.where(:player_black_id == @id))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:game_id, :status, :start_date, :who_moves, :fen, :player_black_id, :player_white_id, :end_date)
    end

    def format_moves(who_moves, moves)
      split_moves = moves.split(' ')
      new_moves = ''
      if who_moves == 'black'
        split_moves.each_with_index do |value, index|
          if index % 2 == 0
            new_moves += "W:" + value + " "
          else
            new_moves += "B:" + value + " "
          end
        end
      else
        split_moves.each_with_index do |value, index|
          if index % 2 == 0
            new_moves += "B:" + value + " "
          else
            new_moves += "W:" + value + " "
          end
        end
      end
      return new_moves
    end
end
