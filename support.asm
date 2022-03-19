
    * = $c000

// exports for basic to call directly, in the same namespace for ease
.namespace commands {
    .label setup_screen = @setup_screen
    .label printat      = @printat
}

.namespace zp {
    .label POKER  = $14     // temp store - 2 bytes
    .label CSRCOL = 211
    .label CSRLN  = 214
}

.namespace kernal {
    .label CHROUT = $FFD2
    .label CHKCOM = $AEFD   // Parse comma
    .label GETBYT = $B79E   // eval number to FAC1 and x
    .label STUPT  = $E56C   // Set cursor pos from 211/214
    .label PRINTC = $AAA2   // print command argument loop
    .label CLRSCR = $E544
}


setup_screen: {
    lda #0                  // black
    sta $d020               // border colour
    sta $d021               // background colour

    lda #1                  // white
    sta $0286               // text colour

    jmp kernal.CLRSCR       // clear the screen
}

printat: {
    jsr kernal.CHKCOM       // parse comma
    jsr kernal.GETBYT       // parse small number
    stx zp.POKER
    jsr kernal.CHKCOM       // parse comma
    jsr kernal.GETBYT       // parse small number

    stx zp.CSRLN
    ldx zp.POKER
    stx zp.CSRCOL
    jsr kernal.STUPT        // update cursor position

    jsr kernal.CHKCOM       // parse comma
    jmp kernal.PRINTC       // Print anything else using the PRINT internals
}
