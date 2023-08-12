teamDashboard = function(output, balance, spent, highest, player, point, mplayer, values, team) {
  
  cost = read.csv(paste0("data/", team, ".csv"))[,-1]
  
  output[[balance]] = renderText({
    paste(values$tpoint - sum(cost$Price))
  })
  output[[spent]] = renderText({
    paste(sum(cost$Price))
  })
  output[[highest]] = renderText({
    balance = values$tpoint - sum(cost$Price)
    paste(balance - (values$nop - 1 - nrow(cost)) * values$base)
  })
  output[[player]] = renderText({
    paste(nrow(cost))
  })
  output[[point]] = renderText({
    paste((values$nop - 1 - nrow(cost)) * values$base)
  })
  output[[mplayer]] = renderText({
    paste(values$nop - nrow(cost) - 1)
  })
}



teamDashboardUI = function(teamsList) {
  


box(
  lapply(teamsList, function(team) {
    balance = paste0("balance", team)
    spent = paste0("spent", team)
    highest = paste0("highest", team)
    player = paste0("player", team)
    point = paste0("point", team)
    mplayer = paste0("mplayer", team)
    
    div(h2(team),
        strong(
          p("Balance: ", textOutput(balance, inline = TRUE)),
          p("Spent: ", textOutput(spent, inline = TRUE)),
          p("Highest Bid: ", textOutput(highest, inline = TRUE)),
          p("Players: ", textOutput(player, inline = TRUE)),
          p(
            "You have to keep ",
            textOutput(point, inline = TRUE),
            "points to buy ",
            textOutput(mplayer, inline = TRUE),
            " more players after this bid."
          )
        ),
        
        class = "boxc")
  }),
  class = "grid grid--1x2",
  width = 10,
  align = "center"
)
}
