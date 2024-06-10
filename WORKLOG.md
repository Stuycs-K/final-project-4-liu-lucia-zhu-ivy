# Work Log

## GROUP MEMBER 1 (LUCIA LIU)

### date 5/22/24

Created the Tetris, Blocks, and Grid classes; pushed it to Git. Figuring out merging and branch mechanics. Created two new branches, one for each person.

### date 5/23/24

Created Tetris playing grid (20 x 10 blocks), which is where blocks will appear and drop. 

### date 5/24/24

Created 6 signs, which will be used to indicate score, top score, time, next block that will drop, number of lines cleared,
and the current falling speed of the blocks. 

### date 5/25/24

Added 2 more signs (one showing block statistics and the other displaying the current mode: sand or normal)

### date 5/28/24

Worked on Grid class; Coded spawnBlocks, which takes a random tetromino from a "bag" 
(represented by the ArrayList toSpawn) and sets the instance variable curr to said tetromino.

### date 6/1/24

Worked on Grid class; ran into a couple of problems, such as slow speed when the fall() mechanics
is implemented, plus the trail that the tetromino leaves behind as it falls. Currently 
trying to incorporate tetrominos into the grid once they reach the bottom. Also trying to change
the 2D array to an ArrayList of arrays. 

### date 6/2/24

Fixed a bunch of bugs, such as index error bounds involving moving a block left, right, or down
Successfully incorporated blocks (specifically their colors) into grid once they hit the bottom.
Changed the grid 2D array into an ArrayList of arrays.
Implemented the lineClearing mechanism. 
Displayed points earned, number of lines cleared, instructions + pausing and quitting
Now we have a working Tetris game

### date 6/3/24

Trying to delay the block when locking-in so there's extra time for the block to shimmy.

### date 6/5/24

Modified shouldStop() so that it returns true when the block has already overlapped another block
or gone out of bounds. This provides a delay for the block to shimmy before it locks in.

### date 6/7/24

Implementing fixFloorRotation() which should make the block kick off the floor if the 
rotated image of the block goes out of bounds.

### date 6/8/24

Fixed rotation issues by trying different possible positions of the rotated block
and choosing the position that is valid (does not overlap other blocks or go out of bounds)

### date 6/9/24

Implemented lose and a game over screen.
Added hard drop and soft drop point mechanics.
Coded shouldDraw which fixed the majority of displaying problems 
related to the modified shouldStop()
Added text to all of the signs.
Cut off the top of the displayed grid to make it easier to implement lose.
Finalized game.


## GROUP MEMBER 2 (IVY ZHU)

### date 5/22/24

Wrote abstract class Blocks, figured out merge and branch

### date 5/23/24

Created all 7 tetrominoes and constructors

### date 5/24/24

Tried writing up and down for I, J, L

### date 5/25/24

Tried working on displaying tetromino, need to figure out

### date 5/28/24

Decided on how to display the grid, finished writing rotations for tetrominoes

### date 5/29/24

Worked on displaying blocks, got a display working!

### date 6/02/24

When the down key is held continuously, there are issues with spawning. 
Game usually starts with a J tetromino
Tried out new way to map completed rows

### date 6/03/24

Tried to implement space bar, but not working. 
quit() works now!
Need to discuss with Lucia how to have space bar working without changing a lot of code

### date 6/06/24

space() works! 
displayNext() works!
Made it so that cycles through all 7 tetrominoes at first and then repeats

### date 6/07/24

Made the blocks speed up
Made bag size smaller and fixed spawnNew

### date 6/09/24

Fixed rotations at the bottom
Made pause so that keys don't work
Worked on displaying signs