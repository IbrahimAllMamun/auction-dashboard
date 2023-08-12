tableBox = function(id, heading, class=""){
  box(
    h2(heading),
    DT::dataTableOutput(id),
    class = "player-box",
    width = 12
  )
}

tableBox = function(id, heading, class="", width){
  box(
    h2(heading),
    DT::dataTableOutput(id),
    class = class,
    width = width
  )
}