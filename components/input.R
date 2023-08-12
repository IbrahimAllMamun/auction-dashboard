inputSection = function(teamsList) {
  box(
    selectInput("team", "Buying Team",
                choices = teamsList),
    numericInput("id", "Player ID", value = NULL),
    numericInput("price", "Price", value = NULL),
    actionButton(
      "submit",
      "Submit",
      icon = tags$i(class = "icon fa-solid fa-gauge-high"),
      class = "button"
    ),
    
    width = 5
  )
}
results = c()
legendBox = box(lapply(1:6, function(i) {
  results[i] = paste0("result", i)
  textOutput(results[i])
}))




inputLogic = function(input, output, teamsList, adat) {
  observeEvent(input$submit, {
    filename = paste0("data/", input$team, ".csv")
    file = read.csv(filename)[, -1]
    
    if (is.na(input$id) | is.na(input$price)) {
      output$result1 = renderText({
        paste("fields are empty.")
      })
      
      lapply(2:6, function(i) {
        output[[paste0("result", i)]] = renderText({
          paste(" ")
        })
      })
    }
    
    else if ((input$id %in% read.csv(paste0("data/", teamsList[1], ".csv"))[,-1]$ID) |
             (input$id %in% read.csv(paste0("data/", teamsList[2], ".csv"))[,-1]$ID) |
             (input$id %in% read.csv(paste0("data/", teamsList[3], ".csv"))[,-1]$ID) |
             (input$id %in% read.csv(paste0("data/", teamsList[4], ".csv"))[,-1]$ID) |
             (input$id %in% read.csv(paste0("data/", teamsList[5], ".csv"))[,-1]$ID)) {
      output$result1 = renderText({
        paste("Player sold before.")
      })
      
      lapply(2:6, function(i) {
        output[[paste0("result", i)]] = renderText({
          paste(" ")
        })
      })
    } else  {
      name = adat[adat$ID == input$id,]$Name[1]
      batch = adat[adat$ID == input$id,]$Batch[1]
      
      file[nrow(file) + 1,] <-
        c(input$id, input$price, name, batch)
      write.csv(file, file = filename, append = TRUE)
      
      file = read.csv("data/sold.csv")[, -1]
      file[nrow(file) + 1,] <-
        c(input$id, input$price, name, batch)
      write.csv(file, file = "data/sold.csv", append = TRUE)
      
      
      
      
      
      labels = c(
        paste("Player bought. "),
        paste("Buying Team: ", input$team),
        paste("ID: ", input$id),
        paste("Price: ", input$price),
        paste("Name: ", name),
        paste("Batch: ", batch)
        
      )
      
      lapply(1:6, function(i) {
        output[[paste0("result", i)]] = renderText({
          paste(labels[i])
        })
      })
    }
  })
}