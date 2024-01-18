import 'package:flutter/material.dart';
import 'package:game1/Game1(2024)/tile.dart';
import 'package:lordicon/lordicon.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'game.dart';
import 'grid.dart';
import 'mycolor.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<List<int>> grid = [];
  List<List<int>> gridNew = [];
   SharedPreferences? sharedPreferences;
  int score = 0;
  bool isgameOver = false;
  bool isgameWon = false;

  List<Widget> getGrid(double width, double height) {
    List<Widget> grids = [];
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        int num = grid[i][j];
        String number;
        int color;
        if (num == 0) {
          color = MyColor.emptyGridBackground;
          number = "";
        } else if (num == 2 || num == 4) {
          color = MyColor.gridColorTwoFour;
          number = "${num}";
        } else if (num == 8 || num == 64 || num == 256) {
          color = MyColor.gridColorEightSixtyFourTwoFiftySix;
          number = "${num}";
        } else if (num == 16 || num == 32 || num == 1024) {
          color = MyColor.gridColorSixteenThirtyTwoOneZeroTwoFour;
          number = "${num}";
        } else if (num == 128 || num == 512) {
          color = MyColor.gridColorOneTwentyEightFiveOneTwo;
          number = "${num}";
        } else {
          color = MyColor.gridColorWin;
          number = "${num}";
        }
        double size = 0 ;
        String n = "${number}";
        switch (n.length) {
          case 1:
          case 2:
            size = 40.0;
            break;
          case 3:
            size = 30.0;
            break;
          case 4:
            size = 20.0;
            break;
        }
        grids.add(Tile(number, width, height, color, size));
      }
    }
    return grids;
  }

  void handleGesture(int direction) {
    /*
    
      0 = up
      1 = down
      2 = left
      3 = right

    */
    bool flipped = false;
    bool played = true;
    bool rotated = false;
    if (direction == 0) {
      setState(() {
        grid = transposeGrid(grid);
        grid = flipGrid(grid);
        rotated = true;
        flipped = true;
      });
    } else if (direction == 1) {
      setState(() {
        grid = transposeGrid(grid);
        rotated = true;
      });
    } else if (direction == 2) {
    } else if (direction == 3) {
      setState(() {
        grid = flipGrid(grid);
        flipped = true;
      });
    } else {
      played = false;
    }

    if (played) {
      print('playing');
      List<List<int>> past = copyGrid(grid);
      print('past ${past}');
      for (int i = 0; i < 4; i++) {
        setState(() {
          List result = operate(grid[i], score, sharedPreferences!);
          score = result[0];
          print('score in set state ${score}');
          grid[i] = result[1];
        });
      }
      setState(() {
        grid = addNumber(grid, gridNew);
      });
      bool changed = compare(past, grid);
      print('changed ${changed}');
      if (flipped) {
        setState(() {
          grid = flipGrid(grid);
        });
      }

      if (rotated) {
        setState(() {
          grid = transposeGrid(grid);
        });
      }

      if (changed) {
        setState(() {
          grid = addNumber(grid, gridNew);
          print('is changed');
        });
      } else {
        print('not changed');
      }

      bool gameover = isGameOver(grid);
      if (gameover) {
        print('game over');
        setState(() {
          isgameOver = true;
        });
      }

      bool gamewon = isGameWon(grid);
      if (gamewon) {
        print("GAME WON");
        setState(() {
          isgameWon=true;          
        });
      }
      print(grid);
      print(score);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    grid = blankGrid();
    gridNew = blankGrid();
    addNumber(grid, gridNew);
    addNumber(grid, gridNew);
    super.initState();
  }

  Future<String> getHighScore() async {
    sharedPreferences = await SharedPreferences.getInstance();
    int? score = sharedPreferences?.getInt('high_score');
    if (score == null) {
      score = 0;
    }
    return score.toString();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width;
    double gridWidth = (width - 80) / 4;
    double gridHeight = gridWidth;
    double height = 30 + (gridHeight * 4) + 10;

    var controller = IconController.assets('assets/Icon1.json');

    controller.addStatusListener((status) {



      if ( status == ControllerStatus.completed ) {
        controller.playFromBeginning();
      }
      if ( status == ControllerStatus.ready ) {
        controller.play();

      }
    });






    return LayoutBuilder(
      //ما قبل الهبد
        builder: (BuildContext context, BoxConstraints constraints) {
          if(constraints.maxWidth < 550 ){
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text(
                  'Froid 2048',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Color(MyColor.appBarBackground),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: gridWidth * 1.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(MyColor.scoreHighScoreRePlayIconGameBackground),
                        ),
                        height: gridWidth  ,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Score',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 3,),
                            Text(
                              '${score}',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        height: height,
                        color: Color(MyColor.gridBackground),
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: GestureDetector(
                                child: GridView.count(
                                  primary: false,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  crossAxisCount: 4,
                                  children: getGrid(gridWidth, gridHeight),
                                ),
                                onVerticalDragEnd: (DragEndDetails details) {
                                  //primaryVelocity -ve up +ve down
                                  if (details.primaryVelocity! < 0) {
                                    handleGesture(0);
                                  } else if (details.primaryVelocity! > 0) {
                                    handleGesture(1);
                                  }
                                },
                                onHorizontalDragEnd: (details) {
                                  //-ve right, +ve left
                                  if (details.primaryVelocity! > 0) {
                                    handleGesture(2);
                                  } else if (details.primaryVelocity! < 0) {
                                    handleGesture(3);
                                  }
                                },
                              ),
                            ),
                            isgameOver
                                ? Container(
                              height: height,
                              color: Color(MyColor.transparentWhite),
                              child: Center(
                                child: Text(
                                  'Game over!',
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(MyColor.gridBackground)),
                                ),
                              ),
                            )
                                : SizedBox(),
                            isgameWon
                                ? Container(
                              height: height,
                              color: Color(MyColor.transparentWhite),
                              child: Center(
                                child: Text(
                                  'You Won!',
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(MyColor.gridBackground)),
                                ),
                              ),
                            )
                                : SizedBox(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0 ,right:  10.0 , top: 55 ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(

                              child: Container(
                                width: gridHeight *1.25,
                                height: gridHeight,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Color(MyColor.scoreHighScoreRePlayIconGameBackground),
                                ),
                                child: Center(
                                  child:  Icon(
                                    Icons.refresh,
                                    color: Colors.white70,
                                  ),

                                ),
                              ),
                              onTap: (){
                                setState(() {
                                  grid = blankGrid();
                                  gridNew = blankGrid();
                                  grid = addNumber(grid, gridNew);
                                  grid = addNumber(grid, gridNew);
                                  score = 0;
                                  isgameOver=false;
                                  isgameWon=false;
                                });

                              },
                            ),
                            Container(
                              width: gridHeight *1.20,
                              height: gridHeight,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Color(MyColor.scoreHighScoreRePlayIconGameBackground),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'High Score',
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  FutureBuilder<String>(
                                    future: getHighScore(),
                                    builder: (ctx, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                          "${snapshot.data}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        );
                                      } else {
                                        return Text(
                                          '0',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        );
                                      }
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          else{
            return  Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(child: Text("Sorry The game is intended for the phone only , \n please wait for the tablet to be updated . \n Thank you" ,textAlign: TextAlign.center,)),
                  const SizedBox(height: 30,),
                  Center(
                    child: IconViewer(
                      controller: controller,
                      width: 75,
                      height: 75,
                    ),
                  ),
                ],
              ),
            );

          }
        },
    );
  }


}
