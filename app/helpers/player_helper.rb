module PlayerHelper
  def display_player_name(player)
    return "-" if player.nil?
    player.display_name
  end
end