module TeamsHelper

  def allTeams
    @teams = Team.all
  end

  def checkTeam
    if Team.count == 0
        Team.create(name: "No Team", location: "", coach: "")
        Team.create(name: "WebDev", location: "Julian 109", coach: "Khadija")
    end
  end
end
