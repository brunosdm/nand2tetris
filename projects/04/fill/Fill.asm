// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

      @BLACK
      M=0
      M=M-1

      @WHITE
      M=0

      @24576
      D=A
      @KEYBOARD
      M=D

(LOOP_IF_ZERO)
      @KEYBOARD
      A=M
      D=M
      @LOOP_IF_ZERO
      D;JEQ

      @SCREEN
      D=A
      @SCREEN_POS
      M=D

(BLACK_LOOP)
      @BLACK
      D=M
      @SCREEN_POS
      A=M
      M=D
      @SCREEN_POS
      M=M+1
      D=M
      @KEYBOARD
      A=M
      D=D-A
      @LOOP_IF_NOT_ZERO
      D;JEQ
      @BLACK_LOOP
      0;JMP

(LOOP_IF_NOT_ZERO)
      @KEYBOARD
      A=M
      D=M
      @LOOP_IF_NOT_ZERO
      D;JNE

      @SCREEN
      D=A
      @SCREEN_POS
      M=D

(WHITE_LOOP)
      @WHITE
      D=M
      @SCREEN_POS
      A=M
      M=D
      @SCREEN_POS
      M=M+1
      D=M
      @KEYBOARD
      A=M
      D=D-A
      @LOOP_IF_ZERO
      D;JEQ
      @WHITE_LOOP
      0;JMP
