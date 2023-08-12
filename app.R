library(shiny)
library(shinydashboard)
library(readxl)
library(DT)


source("style.R")
source("components/dashboard.R")
source("components/presentation.R")
source("components/input.R")
source("components/tables.R")


prevals = data.frame(
  nop = 10,
  base = 20,
  tpoint = 1000
)

nop = 10
base = 20
tpoint = 1000


teams = c("Alumni",
          "Bright",
          "Ibrahim",
          "Shoayeb",
          "Mostofa")



adat = read_excel("data/Auction.xlsx", sheet = "Players")


ui <- fluidPage(
  tags$script(src = "https://kit.fontawesome.com/e64234b261.js"),
  style(),
  
  dashboardPage(
    skin = "purple",
    dashboardHeader(title = "ASPL"),
    dashboardSidebar(
      sidebarMenu(
        menuItem(
          "Presentation",
          tabName = "present",
          icon = tags$i(class = "icon fa-solid fa-person-chalkboard")
          
        ),
        menuItem(
          "Input",
          tabName = "input",
          icon = tags$i(class = "icon fa-regular fa-keyboard")
        ),
        menuItem(
          "Dashboard",
          tabName = "dashboard",
          icon = tags$i(class = "icon fa-solid fa-gauge-high")
        ),
        menuItem(
          "Team List",
          tabName = "pList",
          icon = tags$i(class = "icon fa-solid fa-user")
        ),
        menuItem(
          "Unsold Player",
          tabName = "uList",
          icon = tags$i(class = "icon fa-solid fa-face-sad-tear")
        ),
        menuItem(
          "All Player",
          tabName = "apList",
          icon = tags$i(class = "icon fa-solid fa-people-group")
        )
        
        
      )
    ),
    dashboardBody(tabItems(
      tabItem(
        "present",
        sectionUI, 
        genButton
      ),
      
      
      
      tabItem(
        "input",
        
        inputSection(teams),
        legendBox
      ),
      # The Dashboard tab
      tabItem("dashboard",
              teamDashboardUI(teams)
              ),
      # The Player List tab
      tabItem(
        "pList",
        selectInput("teamPL", "Team Name",
                    choices = teams),
        
        tableBox(
          id="table", 
          heading=textOutput("tabheading"), 
          width=10
        )
      ),
      
      tabItem(
        "uList",
        tableBox(
          id="utable", 
          heading="Unsold Players List", 
          class="player-box", width=12
          )
      ),
      
      tabItem(
        "apList",
        tableBox(
          id="aptable", 
          heading="All Players List", 
          class="player-box", width=12
          )
      )
    ))
  )
)

server <- function(input, output) {
  
  present(input, output, adat=adat)
  
  
  inputLogic(input, output, teams, adat)
  
  
  output$table = DT::renderDataTable({
    filename = paste0("data/", input$teamPL, ".csv")
    file = read.csv(filename)[,-1]
    file
  })
  output$utable = DT::renderDataTable({
    unsold = read.csv("data/unsold.csv")[,-1]
    adat[adat$ID %in% unsold,-1]
  })
  output$aptable = DT::renderDataTable({
    adat[, -1]
  })
  
  
  output$tabheading = renderText(input$teamPL)
  
  lapply(teams, function(team){
    teamDashboard(
      output,
      paste0("balance",team), 
      paste0("spent",team), 
      paste0("highest",team), 
      paste0("player",team), 
      paste0("point",team), 
      paste0("mplayer",team), 
      prevals, team
    )
  })
}

# Run the application
shinyApp(ui = ui, server = server)
