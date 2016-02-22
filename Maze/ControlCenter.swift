//
//  ControlCenter.swift
//  Maze
//
//  Created by Jarrod Parkes on 8/14/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//
import UIKit

class ControlCenter {

    var mazeController: MazeController!

    func moveComplexRobot(myRobot: ComplexRobotObject) {
        let robotIsBlocked = isFacingWall(myRobot, direction: myRobot.direction)
            // print("robotIsBlocked: \(robotIsBlocked)")
        let myWallInfo = checkWalls(myRobot)
            // print("myWallInfo: \(myWallInfo)")
        let isThreeWayJunction = (myWallInfo.numberOfWalls == 1)
        let isTwoWayPath = (myWallInfo.numberOfWalls == 2)
        let isDeadEnd = (myWallInfo.numberOfWalls == 3)
            // print("isThreeWayJunction: \(isThreeWayJunction)")
            // print("isTwoWayPath: \(isTwoWayPath)")
            // print("isDeadEnd: \(isDeadEnd)")
        
        if isThreeWayJunction && robotIsBlocked {
            randomlyRotateRightOrLeft(myRobot)
            // print("isThreeWayJunction && robotIsBlocked -> randomlyRotateRightOrLeft")
        } else if isThreeWayJunction && !robotIsBlocked {
            continueStraightOrRotate(myRobot, wallInfo: myWallInfo)
            // print("isThreeWayJunction && !robotIsBlocked -> continueStraightOrRotate")
        } else if isTwoWayPath && robotIsBlocked {
            turnTowardClearPath(myRobot, wallInfo: myWallInfo)
            // print("isTwoWayPath && robotIsBlocked -> turnTowardClearPath")
        } else if isTwoWayPath && !robotIsBlocked {
            myRobot.move()
            // print("isTwoWayPath && !robotIsBlocked -> move")
        } else if isDeadEnd && robotIsBlocked {
            myRobot.rotateRight()
            // print("isDeadEnd && robotIsBlocked -> rotateRight")
        } else {
            myRobot.move()
            // print("isDeadEnd && !robotIsBlocked -> move")
        }

        
        // Step 3.2
        // Two-way Path - else-if statements
        
        // If the robot encounters a two way path and there is NO wall ahead it should continue forward.
        
        // If the robot encounters a two way path and there IS a wall ahead, it should turn in the direction of the clear path.
        
    }
    
    func previousMoveIsFinished(robot: ComplexRobotObject) {
            self.moveComplexRobot(robot)
    }
    
}