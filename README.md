**Overview**
This is an x86 Assembly implementation of Conway’s Game of Life, a cellular automaton devised by mathematician John Conway.
The simulation runs based on a set of simple rules that determine the state of each cell in a 2D grid over successive generations.

**Rules of the Game**
Each cell in the grid can be alive (1) or dead (0) and follows these rules:
1)A live cell with fewer than two live neighbors dies (underpopulation).
2)A live cell with two or three live neighbors survives.
3)A live cell with more than three live neighbors dies (overpopulation).
4)A dead cell with exactly three live neighbors becomes alive (reproduction).
