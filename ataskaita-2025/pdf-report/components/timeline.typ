#let timeline-item(
  content: "",
  index: 1,
  type: "default",
  primaryColor: rgb("#1A1A1A"),
  accentColor: rgb("#fbad13"),
  is-last: false,
) = {
  // Get status text and color based on type
  let status = ""
  let dot-color = rgb("#d9d9d9")
  let dot-fill = white
  let status-text-color = black
  
  if type == "success" {
    status = "įgyvendinta"
    dot-color = rgb("#52c41a")  // Green color for success
    status-text-color = rgb("#52c41a").darken(20%)
  } else if type == "warning" {
    status = "įgyvendinama"
    dot-color = rgb("#fbb01b")  // Amber color for warning/in progress
    status-text-color = rgb("#fbb01b").darken(10%)
  } else if type == "not-planned" {
    status = "atsisakyta"
    dot-color = rgb("#d9d9d9")  // Gray for abandoned
    status-text-color = rgb("#777777")
  } else if type == "error" {
    status = "neįgyvendinta"
    dot-color = rgb("#ff4d4f")  // Red for error/not implemented
    status-text-color = rgb("#ff4d4f").darken(10%)
  } else {
    status = "bus vykdoma"
    dot-color = rgb("#d9d9d9")  // Gray for default
    status-text-color = rgb("#777777")
  }
  
  let title = [#index uždavinys: #text(fill: status-text-color, weight: "medium")[#status]]
  
  // Container to hold the timeline dot and line
  box(width: 100%, inset: 0pt, outset: 0pt)[
    // Calculate consistent positions
    #let dot-size = 15pt
    #let dot-radius = dot-size / 2
    #let line-width = 1pt
    #let dot-x = -20pt
    #let dot-y = 2pt
    #let line-x = dot-x + dot-radius - (line-width / 2)
    
    // Draw vertical line first (below the dot) if not the last item
    #if not is-last {
      place(
        top + left,
        dx: line-x,
        dy: dot-y + dot-size, 
        box(
          height: 35pt,
          width: line-width,
          fill: rgb("#d9d9d9")
        )
      )
    }
    
    // Then draw the dot (so it appears on top of the line)
    #place(
      top + left,
      dx: dot-x, 
      dy: dot-y,
      box(
        width: dot-size,
        height: dot-size,
        stroke: 2pt + dot-color,
        radius: 50%,
        fill: white
      )
    )
    
    // Title and content with improved spacing
    #pad(left: 12pt)[
      // Title with improved weight
      #text(weight: "bold", title)
      
      // Add a small space between title and content
      #v(3pt)
      
      // Content with improved size and line height
      #text(size: 0.9em, fill: rgb("#333333"))[#content]
    ]
    
    // Add consistent space after each item
    #v(25pt)
  ]
}

#let goal-timeline(
  items: (),
  primaryColor: rgb("#1A1A1A"),
  accentColor: rgb("#fbad13")
) = {
  // Timeline container with improved padding
  block(inset: (top: 8pt, bottom: 8pt), width: 100%)[
    #pad(left: 25pt)[
      #for (i, item) in items.enumerate() {
        timeline-item(
          content: item.content,
          index: i + 1,
          type: item.at("type", default: "default"),
          primaryColor: primaryColor,
          accentColor: accentColor,
          is-last: i == items.len() - 1
        )
      }
    ]
  ]
}

#let goal-results(
  content,
  primaryColor: rgb("#1A1A1A"),
  accentColor: rgb("#fbad13")
) = {
  // A styled box for showing the goal results
  block(
    width: 100%,
    fill: accentColor.lighten(90%),
    stroke: (left: 4pt + accentColor),
    radius: 3pt,
    inset: (x: 1.2em, y: 1em),
  )[
    #text(weight: "bold", size: 1.1em)[☑️ Kas įgyvendinta?]
    
    #content
  ]
}
