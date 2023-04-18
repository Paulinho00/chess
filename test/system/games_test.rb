require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  setup do
    @game = games(:one)
  end

  test "visiting the index" do
    visit games_url
    assert_selector "h1", text: "Games"
  end

  test "should create game" do
    visit games_url
    click_on "New game"

    fill_in "End date", with: @game.end_date
    fill_in "Fen", with: @game.fen
    fill_in "Game", with: @game.game_id
    fill_in "Player black", with: @game.player_black_id
    fill_in "Player white", with: @game.player_white_id
    fill_in "Start date", with: @game.start_date
    fill_in "Status", with: @game.status
    fill_in "Who moves", with: @game.who_moves
    click_on "Create Game"

    assert_text "Game was successfully created"
    click_on "Back"
  end

  test "should update Game" do
    visit game_url(@game)
    click_on "Edit this game", match: :first

    fill_in "End date", with: @game.end_date
    fill_in "Fen", with: @game.fen
    fill_in "Game", with: @game.game_id
    fill_in "Player black", with: @game.player_black_id
    fill_in "Player white", with: @game.player_white_id
    fill_in "Start date", with: @game.start_date
    fill_in "Status", with: @game.status
    fill_in "Who moves", with: @game.who_moves
    click_on "Update Game"

    assert_text "Game was successfully updated"
    click_on "Back"
  end

  test "should destroy Game" do
    visit game_url(@game)
    click_on "Destroy this game", match: :first

    assert_text "Game was successfully destroyed"
  end
end
