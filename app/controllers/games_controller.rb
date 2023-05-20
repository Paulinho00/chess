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

    @white_player = Player.find(game.player_white_id).username
    @black_player = Player.find(game.player_black_id).username


    starting_fen = game.fen
    split_fen = starting_fen.split(' ')[0].split('/')
    positions = Array.new(8)
    current_row = 0
    for row in split_fen
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
      @whoMoves = 'Black'
    else
      @whoMoves = 'White'

    end
    @positions = positions
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

      def is_digit?(s)
        code = s.ord
        # 48 is ASCII code of 0
        # 57 is ASCII code of 9
        48 <= code && code <= 57
  end
end
