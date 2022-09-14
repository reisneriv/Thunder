library(data.table)
shots <- fread("shots_data.csv")

cat("Original data frame:\n")
print(shots)

# Split data frame by gender
s <- split(shots, shots$team)


# Print split data
cat("\nAfter splitting data:\n")
print(s)

teamA = s$`Team A`
teamB = s$`Team B`

teamAx = abs(teamA$x)
teamAy = teamA$y
teamAfg = teamA$fgmade


teamBx = abs(teamB$x)
teamBy = teamB$y
teamBfg = teamB$fgmade

teamAtotalCorner3 = 0
teamAtotalArc3 = 0
teamAtotal2shots = 0
teamAcorner3fgMade = 0
teamA3fgMade = 0
teamA2fgMade = 0


teamBtotalCorner3 = 0
teamBtotalArc3 = 0
teamBtotal2shots = 0
teamBcorner3fgMade = 0
teamB3fgMade = 0
teamB2fgMade = 0

#Team A corner 3's
x = 0
i = 1
for (x in 1:nrow(teamA)){
  if (teamAx[i] > 22){
    if (teamAy[i] < 7.8){
      teamAtotalCorner3 = teamAtotalCorner3 +1
      if (teamAfg[i] == 1){
        teamAcorner3fgMade = teamAcorner3fgMade + 1
      }
    }
  }
  i = i + 1
  x = x + 1
}
print(teamAtotalCorner3)
teamAcorner3ptpercentage = teamAcorner3fgMade/teamAtotalCorner3
sprintf("%f is the corner 3 percentage for team A", round(teamAcorner3ptpercentage, digits = 3))

#Team A arc 3's
teamAarcShot = teamAx^2 + teamAy^2
x=0
i=1
for (x in 1:nrow(teamA)){
  if (teamAarcShot[i] > 23.75^2){
    if (teamAy[i] >= 7.8){
      teamAtotalArc3 = teamAtotalArc3 +1
      if (teamAfg[i] == 1){
        teamA3fgMade = teamA3fgMade + 1
      }
    }
  }
  i = i + 1
  x = x + 1
}
print(teamAtotalArc3)
teamAarc3ptpercentage = teamA3fgMade/teamAtotalArc3
sprintf("%f is the arc 3 percentage for team A", round(teamAarc3ptpercentage, digits = 3))

#Team A 2 point shots
x = 0
i = 1
for (x in 1:nrow(teamA)){
  if (teamAarcShot[i] <= 23.75^2){
    if (teamAx[i] <= 22){
      teamAtotal2shots = teamAtotal2shots +1
      if (teamAfg[i] == 1){
        teamA2fgMade = teamA2fgMade + 1
      }
    }
  }
  i = i + 1
  x = x + 1
}
teamA2ptpercentage = teamA2fgMade/teamAtotal2shots
sprintf("%f is the 2 point percentage for team A", round(teamA2ptpercentage, digits = 3))

totalShotsA = teamAtotal2shots + teamAtotalArc3 + teamAtotalCorner3
teamA2ofWhole = teamAtotal2shots/totalShotsA
teamAarc3ofWhole = teamAtotalArc3/totalShotsA
teamAcorner3ofWhole = teamAtotalCorner3/totalShotsA
sprintf("%f is the 2 attempt percentage of the whole for team A", round(teamA2ofWhole, digits = 3))
sprintf("%f is the arc 3 attempt percentage of the whole for team A", round(teamAarc3ofWhole, digits=3))
sprintf("%f is the corner 3 attempt percentage of the whole for team A", round(teamAcorner3ofWhole, digits =3))
print(totalShotsA)

#Team B corner 3's
x = 0
i = 1
for (x in 1:nrow(teamB)){
  if (teamBx[i] > 22){
    if (teamBy[i] < 7.8){
      teamBtotalCorner3 = teamBtotalCorner3 +1
      if (teamBfg[i] == 1){
        teamBcorner3fgMade = teamBcorner3fgMade + 1
      }
    }
  }
  i = i + 1
  x = x + 1
}
print(teamBtotalCorner3)
teamBcorner3ptpercentage = teamBcorner3fgMade/teamBtotalCorner3
sprintf("%f is the corner 3 percentage for team B", round(teamBcorner3ptpercentage, digits = 3))

#Team A arc 3's
teamBarcShot = teamBx^2 + teamBy^2
x=0
i=1
for (x in 1:nrow(teamB)){
  if (teamBarcShot[i] > 23.75^2){
    if (teamBy[i] >= 7.8){
      teamBtotalArc3 = teamBtotalArc3 +1
      if (teamBfg[i] == 1){
        teamB3fgMade = teamB3fgMade + 1
      }
    }
  }
  i = i + 1
  x = x + 1
}
print(teamBtotalArc3)
teamBarc3ptpercentage = teamB3fgMade/teamBtotalArc3
sprintf("%f is the arc 3 percentage for team B", round(teamBarc3ptpercentage, digits = 3))

#Team A 2 point shots
x = 0
i = 1
for (x in 1:nrow(teamB)){
  if (teamBarcShot[i] <= 23.75^2){
    if (teamBx[i] <= 22){
      teamBtotal2shots = teamBtotal2shots +1
      if (teamBfg[i] == 1){
        teamB2fgMade = teamB2fgMade + 1
      }
    }
  }
  i = i + 1
  x = x + 1
}
teamB2ptpercentage = teamB2fgMade/teamBtotal2shots
sprintf("%f is the 2 point percentage for team B", round(teamB2ptpercentage, digits = 3))

totalShotsB = teamBtotal2shots + teamBtotalArc3 + teamBtotalCorner3
teamB2ofWhole = teamBtotal2shots/totalShotsB
teamBarc3ofWhole = teamBtotalArc3/totalShotsB
teamBcorner3ofWhole = teamBtotalCorner3/totalShotsB
sprintf("%f is the 2 attempt percentage of the whole for team B", round(teamB2ofWhole, digits = 3))
sprintf("%f is the arc 3 attempt percentage of the whole for team B", round(teamBarc3ofWhole, digits=3))
sprintf("%f is the corner 3 attempt percentage of the whole for team B", round(teamBcorner3ofWhole, digits =3))
print(totalShotsB)