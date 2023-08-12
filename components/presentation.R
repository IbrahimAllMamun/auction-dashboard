
  sectionUI = box(
    box(
      imageOutput("presentImage"),
      
      class = "presentImage middle",
      width = 8
    ),
    
    box(
      h2("Player Information"),
      strong(
        p("Player ID: ", textOutput("presentID", inline = TRUE)),
        p("Name: ", textOutput("presentName", inline = TRUE)),
        p("Batch: ", textOutput("presentBatch", inline = TRUE)),
        p("Form: ", textOutput("presentForm", inline = TRUE))
      ),
      
      class = "boxc boxa middle",
      width = 4
    ),
    width = 12,
    class = "auto")
  
  genButton = box(
    actionButton(
      "random",
      "Generate Random Player",
      icon = tags$i(class = "icon fa-solid fa-shuffle"),
      
      class = "button button--green"
    ),
    textOutput("leftp"),
    width = 12,
    class = "middle "
  )
  left = 


present = function(input, output, adat) {
  output$presentID = renderText({
    paste("ID")
  })
  output$presentName = renderText({
    paste("Name")
  })
  output$presentBatch = renderText({
    paste("Batch")
  })
  output$presentForm = renderText({
    paste("Form")
  })
  output$presentImage <- renderImage({
    list(src = "images/0.jpg",
         width = "100%",
         height = 330)
    
  }, deleteFile = F)
  
  
  
  observeEvent(input$random, {
    unsold = read.csv("data/unsold.csv")[, -1]
    
    if (length(unsold)==0){
      unsold = setdiff(adat$ID, read.csv("data/sold.csv")[,-1]$ID)
      write.csv(unsold, file = "data/unsold.csv", append = TRUE)
    } else {
      set.seed(Sys.time())
      random = sample(unsold, 1)
      unsold = unsold[unsold!=random]
      
      write.csv(unsold, file = "data/unsold.csv", append = TRUE)
      
      output$presentID = renderText({
        random
      })
      output$presentName = renderText({
        adat[adat$ID == random, ]$Name
      })
      output$presentBatch = renderText({
        adat[adat$ID == random, ]$Batch
      })
      output$presentForm = renderText({
        adat[adat$ID == random, ]$Form
      })
      output$presentImage = renderImage({
        list(
          src = paste0("images/", random, ".jpg"),
          width = "100%",
          height = 330
        )
        
      }, deleteFile = F)
    }
    
    output$leftp = renderText({
      length(unsold)
      })
  })
  
  
}