INCLUDE Irvine32.inc
INCLUDELIB winmm.lib
PlaySoundA PROTO,
    pszSound:PTR BYTE,
    hmod:DWORD,
    fdwSound:DWORD
SND_FILENAME    EQU 00020000h
SND_ASYNC       EQU 00000001h
SND_SYNC        EQU 00000000h
SND_LOOP        EQU 00000008h
SND_NOSTOP      EQU 00000010h

.data
    gamename        BYTE "Rush Hour Game", 0
    sndPickup       BYTE "pickup.wav", 0
    sndDrop         BYTE "drop.wav", 0
    sndCrash        BYTE "crash.wav", 0
    sndBonus        BYTE "bonus.wav", 0
    sndGameOver     BYTE "gameover.wav", 0
    sndCarHorn      BYTE "horn.wav", 0
    sndEngine       BYTE "engine.wav", 0
    sndTimeWarning  BYTE "warning.wav", 0
    sndLevelUp      BYTE "levelup.wav", 0
    sndMenuMusic    BYTE "menu.wav", 0
    
    highScores      DWORD 10 DUP(0)
    playerNames     BYTE 200 DUP(0)
    leadcount       DWORD 0
    
    bytesRead       DWORD ?
    writeBuffer     BYTE 512 DUP(0)
    writeIndex      DWORD ?


    bl1     BYTE "  ============================================================", 0
    bl2     BYTE " ||                                                          ||", 0
    bl3     BYTE " ||              R U S H   H O U R   G A M E                 ||", 0
    bl4     BYTE " ||                                                          ||", 0
    bl5     BYTE "  ============================================================", 0

    mPaused    BYTE "PAUSED - Press P to resume", 0
    
    mCongrats   BYTE "Congratulations! Your score made it to the leaderboard!", 0
    mNoHigh  BYTE "Your score didn't make it to the top 10.", 0
    mEmpty   BYTE "No high scores yet. Be the first!", 0
    msgl1    BYTE "=== TOP 10 HIGH SCORES ===", 0
    msgl2    BYTE ". ", 0
    msgl3      BYTE " - ", 0
    msgl4    BYTE " points", 0
    ansiHideCursor BYTE 27, '[', '?', '2', '5', 'l', 0
    
    menu1   BYTE "1. Start New Game", 0
    menu2   BYTE "2. Continue Game", 0
    menu3   BYTE "3. Difficulty Level", 0
    menu4   BYTE "4. View Leaderboard", 0
    menu5   BYTE "5. Instructions", 0
    menu6   BYTE "6. Exit", 0
    menu7   BYTE "Enter your choice: ", 0
    
    score           DWORD 0
    level           DWORD 1
    lives           DWORD 3
    playerName      BYTE 20 DUP(0)
    gameSpeed       DWORD 50
    ySpeed DWORD 35
    rSpeed    DWORD 55
    mname   BYTE "Enter your name: ", 0
    mdifficult   BYTE "Select Difficulty (1-3): ", 0
    
    totaltime DWORD 60
    currtime    DWORD 0
    fps DWORD 5
    gpaused      BYTE 0
    mtime1         BYTE "Time: ", 0
    mtime2       BYTE "TIME'S UP! Game Over!", 0
    mfinal1   BYTE "Final Score: ", 0
    mfinal2    BYTE "Passengers Delivered: ", 0
    pdilever DWORD 0
    incspeed DWORD 0
    
    mColor1  BYTE "Choose taxi color:", 0
    mColor2  BYTE "1. Yellow Taxi (Fast, -4 for obstacles, -2 for cars)", 0
    mColor3  BYTE "2. Red Taxi (Slow, -2 for obstacles, -3 for cars)", 0
    mColor4  BYTE "3. Random", 0
    mColor5  BYTE "Enter choice: ", 0
    mColor6     BYTE "You selected Yellow Taxi!", 0
    mColor7        BYTE "You selected Red Taxi!", 0
    
    grid         BYTE 484 DUP(0) 
    
    pX         BYTE 1
    pY         BYTE 1
    pColor     DWORD 14
    pType      BYTE 0
    
    onboard BYTE 0
    maxP   BYTE 2
    msgmaxP BYTE "Cannot pick up more passengers! (Max: 2)", 0
    
    passengers      BYTE 25 DUP(0) 
    npcCars         BYTE 50 DUP(0)
    mWelcome      BYTE "Welcome to Rush Hour!", 0
    mScore        BYTE "Score: ", 0
    mLevel        BYTE "Level: ", 0
    mLives        BYTE "Lives: ", 0
    mPass   BYTE "Passengers: ", 0
    
    highscoreFile   BYTE "highscores.txt", 0
    fileHandle      HANDLE ?
    buffer          BYTE 500 DUP(0)
    mInst1 BYTE "Instructions:", 0
    mInst2 BYTE "1. Use Arrow Keys to move your taxi.", 0
    mInst3 BYTE "2. Press Spacebar to pick up/drop passengers.", 0
    mInst4 BYTE "3. Pick up purple passengers and drop at green destinations.", 0
    mInst5 BYTE "4. Maximum 2 passengers at a time in your taxi.", 0
    mInst6 BYTE "5. Avoid red buildings, green trees, and blue NPC cars.", 0
    mInst7 BYTE "6. Collect yellow bonus items ($) for extra points.", 0
    mInst8 BYTE "7. +10 points per successful delivery.", 0
    mInst9 BYTE "8. Press 'P' to Pause/Resume the game.", 0
    mInst10 BYTE "9. Press Esc to Save and return to Main Menu.", 0
    mInst11 BYTE "GAME MODES:", 0
    mInst12 BYTE "- Career Mode: Complete 5 deliveries", 0
    mInst13 BYTE "- Time Mode: Deliver as many as possible in 60 seconds", 0
    mInst14 BYTE "- Endless Mode: Survive as long as possible", 0
    mInst15 BYTE "TAXI TYPES:", 0
    mInst16 BYTE "Yellow Taxi: Fast speed, -4 for obstacles, -2 for cars", 0
    mInst17 BYTE "Red Taxi: Slower speed, -2 for obstacles, -3 for cars", 0
    mInst18 BYTE "Speed increases every 2 successful deliveries!",0


    mOver BYTE "GAME OVER! You lost all lives.", 0, 0
    gamemode        BYTE 0
    reqdrop   DWORD 5 
    difftimer DWORD 0
    difflvl DWORD 1
    mMode1   BYTE "Select Game Mode:", 0
    mMode2  BYTE "1. Career Mode (Complete 5 deliveries with increasing difficulty)", 0
    mMode3  BYTE "2. Time Mode (60 seconds challenge)", 0
    mMode4  BYTE "3. Endless Mode (Survive as long as possible)", 0
    mMode5  BYTE "Enter choice: ", 0

    mcareer   BYTE "Career Mode - Complete 5 deliveries!", 0
    mtimer     BYTE "Time Mode - 60 seconds!", 0
    mendless  BYTE "Endless Mode - Survive!", 0
    mwincareer    BYTE "CONGRATULATIONS! You completed all deliveries!", 0
    mreq     BYTE "Required: ", 0
    currentry DWORD ?
    buffidx DWORD ?
    savegamefile    BYTE "savegame.txt", 0
    mnosaved   BYTE "No saved game found. Please start a new game.", 0
    
    tempBuff      BYTE 2048 DUP(0)
    tempidx       DWORD ?
    inprogress  BYTE 0 

.code

dwordtostr proc
    push ebx
    push ecx
    push edx
    push esi
    push edi
    
    cmp eax, 0
    jne notzero
    mov edi, OFFSET tempBuff
    add edi, tempidx
    mov BYTE PTR [edi], '0'
    inc tempidx
    jmp done1
    
notzero:
    mov ebx, 10
    xor ecx, ecx
    
pushdig:
    xor edx, edx
    div ebx
    add dl, '0'
    push edx
    inc ecx
    cmp eax, 0
    jne pushdig
    
popdig:
    pop edx
    mov edi, OFFSET tempBuff
    add edi, tempidx
    mov [edi], dl
    inc tempidx
    loop popdig
    
done1:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
dwordtostr endp

appNewline proc
    push edi
    mov edi, OFFSET tempBuff
    add edi, tempidx
    mov BYTE PTR [edi], 0dh
    inc tempidx
    mov BYTE PTR [edi + 1], 0ah
    inc tempidx
    pop edi
    ret
appNewline endp

analyseNextDword proc
    push ebx
    push ecx
    push edx
    push esi
    
    mov esi, OFFSET tempBuff
    add esi, tempidx
    xor eax, eax
    xor ebx, ebx
    
analyseloop:
    mov bl, [esi]
    cmp bl, '0'
    jl digitanalysedone
    cmp bl, '9'
    jg digitanalysedone
    
    mov ecx, 10
    mul ecx
    sub bl, '0'
    add eax, ebx
    
    inc esi
    inc tempidx
    jmp analyseloop
    
digitanalysedone:
    mov bl, [esi]
    cmp bl, 0dh
    jne j1
    add tempidx, 2
    jmp done2
j1:
    cmp bl, 0ah
    jne done2
    inc tempidx
    
done2:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
analyseNextDword endp

SaveNPCPass proc
    push ecx
    mov ecx, 5
saveloop1:
    movzx eax, BYTE PTR [esi]
    call dwordtostr
    
    cmp ecx, 1
    je skipcomma
    mov edi, OFFSET tempBuff
    add edi, tempidx
    mov BYTE PTR [edi], ','
    inc tempidx
    
skipcomma:
    inc esi
    loop saveloop1
    
    call appNewline
    pop ecx
    ret
SaveNPCPass endp

gamestateSave proc
    push ebx
    push ecx
    push esi
    push edi
    
    mov ecx, 2048
    mov edi, OFFSET tempBuff
    xor al, al
clrTmpBuff:
    mov [edi], al
    inc edi
    loop clrTmpBuff
    
    mov edi, OFFSET tempBuff
    mov tempidx, 0
    
    mov eax, score
    call dwordtostr
    call appNewline
    
    mov eax, level
    call dwordtostr
    call appNewline
    
    mov eax, lives
    call dwordtostr
    call appNewline
    
    movzx eax, pX
    call dwordtostr
    call appNewline
    
    movzx eax, pY
    call dwordtostr
    call appNewline
    
    mov eax, pColor
    call dwordtostr
    call appNewline
    
    movzx eax, pType
    call dwordtostr
    call appNewline
    
    movzx eax, onboard
    call dwordtostr
    call appNewline
    
    mov esi, OFFSET playerName
    mov ecx, 20
cpyname2buff:
    mov al, [esi]
    cmp al, 0
    je done3
    mov edi, OFFSET tempBuff
    add edi, tempidx
    mov [edi], al
    inc tempidx
    inc esi
    loop cpyname2buff
done3:
    call appNewline
    
    mov eax, gameSpeed
    call dwordtostr
    call appNewline
    
    mov eax, totaltime
    call dwordtostr
    call appNewline
    
    mov eax, pdilever
    call dwordtostr
    call appNewline
    
    mov eax, incspeed
    call dwordtostr
    call appNewline
    
    movzx eax, gamemode
    call dwordtostr
    call appNewline
    
    mov eax, reqdrop
    call dwordtostr
    call appNewline
    
    mov eax, difflvl
    call dwordtostr
    call appNewline
    
    mov eax, ySpeed
    call dwordtostr
    call appNewline
    
    mov eax, rSpeed
    call dwordtostr
    call appNewline
    
    mov eax, currtime
    call dwordtostr
    call appNewline
    
    mov eax, difftimer
    call dwordtostr
    call appNewline
    
    mov ecx, 5
    mov esi, OFFSET passengers
    savePassL:
        call SaveNPCPass
        loop savePassL
    
    mov ecx, 10
    mov esi, OFFSET npcCars
    savenpcL:
        call SaveNPCPass
        loop savenpcL
    

    mov ecx, 484
    mov esi, OFFSET grid
saveMapL:
    push ecx
    movzx eax, BYTE PTR [esi]
    call dwordtostr
    
    cmp ecx, 1
    je skipcomma3
    mov edi, OFFSET tempBuff
    add edi, tempidx
    mov BYTE PTR [edi], ','
    inc tempidx
    
skipcomma3:
    inc esi
    pop ecx
    loop saveMapL
    
    call appNewline
    
    mov edx, OFFSET savegamefile
    call CreateOutputFile
    cmp eax, INVALID_HANDLE_VALUE
    je savefail
    
    mov fileHandle, eax
    
    mov eax, fileHandle
    mov edx, OFFSET tempBuff
    mov ecx, tempidx
    call WriteToFile
    
    mov eax, fileHandle
    call CloseFile
    
    pop edi
    pop esi
    pop ecx
    pop ebx
    mov eax, 1
    ret
    
savefail:
    pop edi
    pop esi
    pop ecx
    pop ebx
    mov eax, 0
    ret
gamestateSave endp

loadgamestate proc
    push ebx
    push ecx
    push esi
    push edi
    
    mov edx, OFFSET savegamefile
    call OpenInputFile
    cmp eax, INVALID_HANDLE_VALUE
    je loadfail
    
    mov fileHandle, eax
    
    mov eax, fileHandle
    mov edx, OFFSET tempBuff
    mov ecx, 2048
    call ReadFromFile
    mov bytesRead, eax
    
    mov eax, fileHandle
    call CloseFile
    
    cmp bytesRead, 0
    je loadfail
    
    mov tempidx, 0
    
    call analyseNextDword
    mov score, eax
    
    call analyseNextDword
    mov level, eax
    
    call analyseNextDword
    mov lives, eax
    
    call analyseNextDword
    mov pX, al
    
    call analyseNextDword
    mov pY, al
    
    call analyseNextDword
    mov pColor, eax
    
    call analyseNextDword
    mov pType, al
    
    call analyseNextDword
    mov onboard, al
    
    mov esi, OFFSET tempBuff
    add esi, tempidx
    mov edi, OFFSET playerName
    mov ecx, 20
    xor al, al
clrPname:
    mov [edi], al
    inc edi
    loop clrPname
    
    mov esi, OFFSET tempBuff
    add esi, tempidx
    mov edi, OFFSET playerName
    mov ecx, 0
cpyPname:
    mov al, [esi]
    cmp al, 0dh
    je done4
    cmp al, 0ah
    je done4
    cmp al, 0
    je done4
    cmp ecx, 19
    jge skipnamech
    mov [edi], al
    inc edi
    inc ecx
skipnamech:
    inc esi
    inc tempidx
    jmp cpyPname
done4:
    add tempidx, 2
    
    call analyseNextDword
    mov gameSpeed, eax
    
    call analyseNextDword
    mov totaltime, eax
    
    call analyseNextDword
    mov pdilever, eax
    
    call analyseNextDword
    mov incspeed, eax
    
    call analyseNextDword
    mov gamemode, al
    
    call analyseNextDword
    mov reqdrop, eax
    
    call analyseNextDword
    mov difflvl, eax
    
    call analyseNextDword
    mov ySpeed, eax
    
    call analyseNextDword
    mov rSpeed, eax
    
    call analyseNextDword
    mov currtime, eax
    
    call analyseNextDword
    mov difftimer, eax
    
    mov ecx, 5
    mov edi, OFFSET passengers
loadpassloop:
    push ecx
    push edi
    
    call analyseNextDword
    mov [edi], al
    
    inc tempidx
    
    call analyseNextDword
    mov [edi + 1], al
    
    inc tempidx
    
    call analyseNextDword
    mov [edi + 2], al
    
    inc tempidx
    
    call analyseNextDword
    mov [edi + 3], al
    
    inc tempidx
    
    call analyseNextDword
    mov [edi + 4], al
    
    pop edi
    add edi, 5
    pop ecx
    loop loadpassloop
    
    mov ecx, 10
    mov edi, OFFSET npcCars
loadnpcloop:
    push ecx
    push edi
    
    call analyseNextDword
    mov [edi], al
    
    inc tempidx
    
    call analyseNextDword
    mov [edi + 1], al
    
    inc tempidx
    
    call analyseNextDword
    mov [edi + 2], al
    
    inc tempidx
    
    call analyseNextDword
    mov [edi + 3], al
    
    inc tempidx
    
    call analyseNextDword
    mov [edi + 4], al
    
    pop edi
    add edi, 5
    pop ecx
    loop loadnpcloop
    
    mov ecx, 484
    mov edi, OFFSET grid
loadmaploop:
    push ecx
    
    call analyseNextDword
    mov [edi], al
    
    cmp ecx, 1
    je skipcomma4
    inc tempidx
    
skipcomma4:
    inc edi
    pop ecx
    loop loadmaploop
    
    pop edi
    pop esi
    pop ecx
    pop ebx
    mov eax, 1
    ret
    
loadfail:
    pop edi
    pop esi
    pop ecx
    pop ebx
    mov eax, 0
    ret
loadgamestate endp

restoreMap proc
    push ecx
    push esi
    push edi
    
    mov ecx, 484
    mov esi, OFFSET grid
    xor al, al
clrmaprestore:
    mov [esi], al
    inc esi
    loop clrmaprestore
    
    mov ecx, 22
    mov esi, OFFSET grid
    mov al, 6
resborTop:
    mov [esi], al
    inc esi
    loop resborTop
    
    mov ecx, 22
    mov esi, OFFSET grid
    add esi, 462
    mov al, 6
resborBot:
    mov [esi], al
    inc esi
    loop resborBot
    
    mov ecx, 22
    mov esi, OFFSET grid
    xor edx, edx
resborSide:
    mov BYTE PTR [esi + edx], 6
    mov BYTE PTR [esi + edx + 21], 6
    add edx, 22
    loop resborSide
    
    mov ecx, 5
    mov esi, OFFSET passengers
respassL:
    push ecx
    
    mov al, [esi + 4]
    cmp al, 1
    jne chkDest
    
    movzx eax, BYTE PTR [esi + 1]
    mov edx, 22
    mul edx
    movzx edx, BYTE PTR [esi]
    add eax, edx
    mov edi, OFFSET grid
    mov BYTE PTR [edi + eax], 3
    jmp nxtPass
    
chkDest:
    cmp al, 2
    jne nxtPass
    
    movzx eax, BYTE PTR [esi + 3]
    mov edx, 22
    mul edx
    movzx edx, BYTE PTR [esi + 2]
    add eax, edx
    mov edi, OFFSET grid
    mov BYTE PTR [edi + eax], 4
    
nxtPass:
    add esi, 5
    pop ecx
    loop respassL
    
    mov ecx, 10
    mov esi, OFFSET npcCars
resNPCL:
    push ecx
    
    mov al, [esi + 4]
    cmp al, 1
    jne nxtnpc
    
    movzx eax, BYTE PTR [esi + 1]
    mov edx, 22
    mul edx
    movzx edx, BYTE PTR [esi]
    add eax, edx
    mov edi, OFFSET grid
    
    cmp BYTE PTR [edi + eax], 0
    jne nxtnpc
    mov BYTE PTR [edi + eax], 5
    
nxtnpc:
    add esi, 5
    pop ecx
    loop resNPCL
    
    mov ecx, 40
resbldgsL:
    push ecx
    call SpawnBuilding
    pop ecx
    loop resbldgsL
    
    mov ecx, 15
    mov eax, difflvl
    dec eax
    mov ebx, 0
    cmp eax, 0
    je done5
obsmultloopRes:
    add ebx, 5
    dec eax
    jnz obsmultloopRes
done5:
    add ecx, ebx
    
resobs:
    push ecx
    call SpawnObstacle
    pop ecx
    loop resobs
    
    mov ecx, 3
resbonus:
    push ecx
    call SpawnBonusItem
    pop ecx
    loop resbonus
    
    pop edi
    pop esi
    pop ecx
    ret
restoreMap endp

loadleaderboard proc
    push ecx
    push edi
    
    mov ecx, 10
    mov edi, OFFSET highScores
    xor eax, eax
clrscores:
    mov [edi], eax
    add edi, 4
    loop clrscores
    
    mov ecx, 200
    mov edi, OFFSET playerNames
    xor al, al
clenames:
    mov [edi], al
    inc edi
    loop clenames
    
    mov leadcount, 0
    pop edi
    pop ecx
    
    mov edx, OFFSET highscoreFile
    call OpenInputFile
    cmp eax, INVALID_HANDLE_VALUE
    je filenotfound
    
    mov fileHandle, eax
    
    mov eax, fileHandle
    mov edx, OFFSET buffer
    mov ecx, 500
    call ReadFromFile
    mov bytesRead, eax
    
    mov eax, fileHandle
    call CloseFile
    
    cmp bytesRead, 0
    je filenotfound
    
    call analyseLeaderboardData
    
    mov eax, 1
    ret
    
filenotfound:
    mov eax, 0
    ret
loadleaderboard endp

analyseLeaderboardData proc
    mov currentry, 0
    mov buffidx, 0
    
analyseLoop:
    mov eax, currentry
    cmp eax, 10
    jge done6
    
    mov eax, buffidx
    cmp eax, bytesRead
    jge done6
    
    push ecx
    push esi
    push edi
    
    mov esi, OFFSET buffer
    add esi, buffidx
    
    mov eax, currentry
    mov ecx, 20
    mul ecx
    mov edi, OFFSET playerNames
    add edi, eax
    
    xor ecx, ecx
readname:
    cmp ecx, 19
    jge skip2comma
    
    mov al, [esi]
    cmp al, ','
    je commafound
    cmp al, 0dh
    je commafound
    cmp al, 0ah
    je commafound
    cmp al, 0
    je done6
    
    mov [edi], al
    inc esi
    inc edi
    inc ecx
    inc buffidx
    jmp readname
    
skip2comma:
    mov al, [esi]
    cmp al, ','
    je commafound
    cmp al, 0dh
    je commafound
    cmp al, 0ah
    je commafound
    cmp al, 0
    je done6
    inc esi
    inc buffidx
    jmp skip2comma
    
commafound:
    mov BYTE PTR [edi], 0
    inc esi
    inc buffidx
    pop edi
    pop esi
    pop ecx
    
    push esi
    push edi
    
    mov esi, OFFSET buffer
    add esi, buffidx
    xor eax, eax
    xor edx, edx
    
readscore:
    mov dl, [esi]
    cmp dl, '0'
    jl endscore
    cmp dl, '9'
    jg endscore
    
    push edx
    mov edx, 10
    mul edx
    pop edx
    sub dl, '0'
    add eax, edx
    
    inc esi
    inc buffidx
    jmp readscore
    
endscore:
    push ecx
    mov ecx, currentry
    mov edi, OFFSET highScores
    mov [edi + ecx*4], eax
    pop ecx
    
    pop edi
    pop esi
    
skip2Newline:
    mov eax, buffidx
    cmp eax, bytesRead
    jge nxt1
    
    mov esi, OFFSET buffer
    add esi, buffidx
    mov al, [esi]
    inc buffidx
    
    cmp al, 0ah
    je nxt1
    cmp al, 0
    je done6
    jmp skip2Newline
    
nxt1:
    inc currentry
    jmp analyseLoop
    
done6:
    mov eax, currentry
    mov leadcount, eax
    ret
analyseLeaderboardData endp

SaveLeaderboard proc
    push ecx
    push edi
    mov ecx, 512
    mov edi, OFFSET writeBuffer
    xor al, al
clrwritebuff:
    mov [edi], al
    inc edi
    loop clrwritebuff
    pop edi
    pop ecx
    
    mov edx, OFFSET highscoreFile
    call CreateOutputFile
    cmp eax, INVALID_HANDLE_VALUE
    je saveError
    
    mov fileHandle, eax
    mov writeIndex, 0
    
    push esi
    push edi
    push ecx
    push ebx
    
    mov edi, OFFSET writeBuffer
    xor ecx, ecx
    
writeL:
    cmp ecx, leadcount
    jge writedatatofile
    cmp ecx, 10
    jge writedatatofile
    
    push ecx
    mov eax, ecx
    mov edx, 20
    mul edx
    mov esi, OFFSET playerNames
    add esi, eax
    
cpyNamech:
    mov al, [esi]
    cmp al, 0
    je done7
    mov [edi], al
    inc esi
    inc edi
    jmp cpyNamech
    
done7:
    mov BYTE PTR [edi], ','
    inc edi
    
    pop ecx
    push ecx
    mov eax, [highScores + ecx*4]
    
    push edx
    mov ebx, 10
    push ecx
    xor ecx, ecx
    
cnvertL:
    xor edx, edx
    div ebx
    add dl, '0'
    push edx
    inc ecx
    cmp eax, 0
    jne cnvertL
    
writedigits:
    pop edx
    mov [edi], dl
    inc edi
    loop writedigits
    
    pop ecx
    pop edx
    
    mov BYTE PTR [edi], 0dh
    inc edi
    mov BYTE PTR [edi], 0ah
    inc edi
    
    pop ecx
    inc ecx
    jmp writeL
    
writedatatofile:
    pop ebx
    pop ecx
    
    mov eax, OFFSET writeBuffer
    sub edi, eax
    mov ecx, edi
    
    pop edi
    pop esi
    
    cmp ecx, 0
    je closenexit
    
    mov eax, fileHandle
    mov edx, OFFSET writeBuffer
    call WriteToFile
    
closenexit:
    mov eax, fileHandle
    call CloseFile
    mov eax, 1
    ret
    
saveError:
    mov eax, 0
    ret
SaveLeaderboard endp

UpdateLeaderboard proc
    push ebx
    push ecx
    push esi
    push edi
    
    call loadleaderboard
    
    mov eax, leadcount
    cmp eax, 10
    jl scorequalify
    
    mov eax, [highScores + 36]
    cmp eax, score
    jge noQualify
    
scorequalify:
    xor ebx, ebx
    xor ecx, ecx
    
findpos:
    cmp ecx, leadcount
    jge insert
    cmp ecx, 10
    jge insert
    
    mov eax, [highScores + ecx*4]
    cmp eax, score
    jl insert
    
    inc ecx
    jmp findpos
    
insert:
    mov ebx, ecx
    
    mov ecx, leadcount
    cmp ecx, 10
    jl nodropreq
    mov ecx, 9
    
nodropreq:
    cmp ecx, ebx
    jle done7
    
shiftL:
    dec ecx
    cmp ecx, ebx
    jl done7
    
    mov eax, [highScores + ecx*4]
    mov [highScores + ecx*4 + 4], eax
    
    push ecx
    push ebx
    
    mov eax, ecx
    mov edx, 20
    mul edx
    mov esi, OFFSET playerNames
    add esi, eax
    
    mov eax, ecx
    inc eax
    mov edx, 20
    mul edx
    mov edi, OFFSET playerNames
    add edi, eax
    
    mov ecx, 20
cpyshiftname:
    mov al, [esi]
    mov [edi], al
    inc esi
    inc edi
    loop cpyshiftname
    
    pop ebx
    pop ecx
    jmp shiftL
    
done7:
    mov eax, score
    mov [highScores + ebx*4], eax
    
    push ebx
    mov eax, ebx
    mov edx, 20
    mul edx
    mov edi, OFFSET playerNames
    add edi, eax
    mov esi, OFFSET playerName
    mov ecx, 20
cpynewName:
    mov al, [esi]
    mov [edi], al
    inc esi
    inc edi
    loop cpynewName
    pop ebx
    
    mov eax, leadcount
    cmp eax, 10
    jge countMaxed
    inc eax
    mov leadcount, eax
    
countMaxed:
    call SaveLeaderboard
    
    call Crlf
    mov dh, 25
    mov dl, 70
    call Gotoxy
    mov edx, OFFSET mCongrats
    call WriteString
    call Crlf
    
    pop edi
    pop esi
    pop ecx
    pop ebx
    mov eax, 1
    ret
    
noQualify:
    call Crlf
    mov dh, 25
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mNoHigh
    call WriteString
    call Crlf
    
    pop edi
    pop esi
    pop ecx
    pop ebx
    mov eax, 0
    ret
UpdateLeaderboard endp

SelectGameMode proc
    call Clrscr
    
    call drawtitle
    
    mov eax, black + (yellow * 16)
    call SetTextColor
    
    mov dh, 20
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mMode1
    call WriteString
    mov dh, 21
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mMode2
    call WriteString
    mov dh, 22
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mMode3
    call WriteString
    mov dh, 23
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mMode4
    call WriteString
    mov dh, 24
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mMode5
    call WriteString
    
    
    call ReadChar
    call WriteChar
    call Crlf
    
    cmp al, '1'
    je CareerMode
    cmp al, '2'
    je TimeMode
    cmp al, '3'
    je EndlessMode
    jmp SelectGameMode
    
CareerMode:
    mov gamemode, 1
    mov reqdrop, 5
    mov totaltime, 0
    mov dh, 25
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mcareer
    call WriteString
    
    mov dh, 26
    mov dl, 75
    call Gotoxy
    call WaitMsg
    ret
    
TimeMode:
    mov gamemode, 0
    mov totaltime, 60
    mov dh, 25
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mtimer
    call WriteString
    
    mov dh, 26
    mov dl, 75
    call Gotoxy
    call WaitMsg
    ret
    
EndlessMode:
    mov gamemode, 2
    mov totaltime, 0
    mov dh, 25
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mendless
    call WriteString
    
    mov dh, 26
    mov dl, 75
    call Gotoxy
    call WaitMsg
    ret
SelectGameMode endp


SelectTaxiColor proc
    call Clrscr
    
    call drawtitle
    
    mov eax, black + (yellow * 16)
    call SetTextColor
    
    mov dh, 20
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mColor1
    call WriteString
    mov dh, 21
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mColor2
    call WriteString
    mov dh, 22
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mColor3
    call WriteString
    mov dh, 23
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mColor4
    call WriteString
    mov dh, 24
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mColor5
    call WriteString
    
    call ReadChar
    call WriteChar
    call Crlf
        
    cmp al, '1'
    je SelectYellow
    cmp al, '2'
    je SelectRed
    cmp al, '3'
    je SelectRandom
    jmp SelectTaxiColor
    
SelectYellow:
    mov pType, 0
    mov pColor, 14
    
    mov eax, ySpeed
    mov gameSpeed, eax
    
    mov dh, 26
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mColor6
    call WriteString
    
    mov dh, 27
    mov dl, 75
    call Gotoxy
    call WaitMsg
    ret
    
SelectRed:
    mov pType, 1
    mov pColor, 12
    
    mov eax, rSpeed
    mov gameSpeed, eax
    
    mov dh, 26
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mColor7
    call WriteString
    
    mov dh, 27
    mov dl, 75
    call Gotoxy
    call WaitMsg
    ret
    
SelectRandom:
    mov eax, 2
    call RandomRange
    cmp eax, 0
    je SelectYellow
    jmp SelectRed
SelectTaxiColor endp


InitializeMap proc
    mov onboard, 0
    mov gpaused, 0
    mov pdilever, 0
    mov currtime, 0
    mov difftimer, 0
    mov difflvl, 1
    mov incspeed, 0
    
    cmp gamemode, 0
    jne CheckCareer
    mov totaltime, 60
    jmp ContinueInit
    
CheckCareer:
    cmp gamemode, 1
    jne CheckEndless
    mov totaltime, 0
    jmp ContinueInit
    
CheckEndless:
    mov totaltime, 0
ContinueInit:
    mov pX, 1
    mov pY, 1
    mov lives, 3
    mov score, 0
    
    mov ecx, 484
    mov esi, OFFSET grid
    mov al, 0
InitLoop:
    mov [esi], al
    inc esi
    loop InitLoop
    
    mov ecx, 25
    mov esi, OFFSET passengers
    mov al, 0
ClearPass:
    mov [esi], al
    inc esi
    loop ClearPass
    
    mov ecx, 50
    mov esi, OFFSET npcCars
    mov al, 0
ClearNPCs:
    mov [esi], al
    inc esi
    loop ClearNPCs
    
    mov ecx, 22
    mov esi, OFFSET grid
    mov al, 6
BorderTop:
    mov [esi], al
    inc esi
    loop BorderTop
    
    mov ecx, 22
    mov esi, OFFSET grid
    add esi, 462
    mov al, 6
BorderBottom:
    mov [esi], al
    inc esi
    loop BorderBottom
    
    mov ecx, 22
    mov esi, OFFSET grid
    mov edx, 0
BorderSide:
    mov BYTE PTR [esi + edx], 6
    mov BYTE PTR [esi + edx + 21], 6
    add edx, 22
    loop BorderSide

    mov esi, OFFSET grid
    mov BYTE PTR [esi + 23], 0
    mov BYTE PTR [esi + 24], 0
    mov BYTE PTR [esi + 45], 0
    mov BYTE PTR [esi + 46], 0
    
    movzx eax, pY
    mov edx, 22
    mul edx
    movzx edx, pX
    add eax, edx
    mov esi, OFFSET grid
    mov BYTE PTR [esi + eax], 8
    
    mov ecx, 40
SpawnBldgs:
    push ecx
    call SpawnBuilding
    pop ecx
    loop SpawnBldgs
    
    mov ecx, 15
    mov eax, difflvl
    dec eax
    mov ebx, 0
    cmp eax, 0
    je DoneObsCalc
ObsMultLoop:
    add ebx, 5
    dec eax
    jnz ObsMultLoop
DoneObsCalc:
    add ecx, ebx
    
SpawnObs:
    push ecx
    call SpawnObstacle
    pop ecx
    loop SpawnObs
    
    mov ecx, 5
SpawnPass:
    push ecx
    call SpawnPassenger
    pop ecx
    loop SpawnPass
    
    mov ecx, 7
    mov eax, difflvl
    dec eax
    shl eax, 1
    add ecx, eax
    
SpawnNPCs:
    push ecx
    call SpawnNPC
    pop ecx
    loop SpawnNPCs
    
    mov ecx, 3
SpawnBonus:
    push ecx
    call SpawnBonusItem
    pop ecx
    loop SpawnBonus

    mov esi, OFFSET grid
    mov BYTE PTR [esi + 23], 0
    mov BYTE PTR [esi + 24], 0
    mov BYTE PTR [esi + 45], 0
    mov BYTE PTR [esi + 46], 0
    
    movzx eax, pY
    mov edx, 22
    mul edx
    movzx edx, pX
    add eax, edx
    mov esi, OFFSET grid
    mov BYTE PTR [esi + eax], 0
    
    ret
InitializeMap endp

SpawnBuilding proc
    mov ecx, 100
RetryBldg:
    push ecx
    mov eax, 20
    call RandomRange
    inc eax
    mov bl, al
    mov eax, 20
    call RandomRange
    inc eax
    mov bh, al
    
    movzx eax, bh
    mov edx, 22
    mul edx
    movzx edx, bl
    add eax, edx
    mov esi, OFFSET grid
    add esi, eax
    
    cmp BYTE PTR [esi], 0
    pop ecx
    je PlaceBldg
    loop RetryBldg
    ret
PlaceBldg:
    mov BYTE PTR [esi], 1
    ret
SpawnBuilding endp

SpawnObstacle proc
    mov ecx, 100
RetryObs:
    push ecx
    mov eax, 20
    call RandomRange
    inc eax
    mov bl, al
    mov eax, 20
    call RandomRange
    inc eax
    mov bh, al
    
    movzx eax, bh
    mov edx, 22
    mul edx
    movzx edx, bl
    add eax, edx
    mov esi, OFFSET grid
    add esi, eax
    
    cmp BYTE PTR [esi], 0
    pop ecx
    je PlaceObs
    loop RetryObs
    ret
PlaceObs:
    mov BYTE PTR [esi], 2
    ret
SpawnObstacle endp

SpawnBonusItem proc
    mov ecx, 100
RetryBonus:
    push ecx
    mov eax, 20
    call RandomRange
    inc eax
    mov bl, al
    mov eax, 20
    call RandomRange
    inc eax
    mov bh, al
    
    movzx eax, bh
    mov edx, 22
    mul edx
    movzx edx, bl
    add eax, edx
    mov esi, OFFSET grid
    add esi, eax
    cmp BYTE PTR [esi], 0
    pop ecx
    je PlaceBonus
    loop RetryBonus
    ret
PlaceBonus:
    mov BYTE PTR [esi], 7
    ret
SpawnBonusItem endp

SpawnNPC proc
    mov ecx, 100
RetryNPC:
    push ecx
    mov eax, 20
    call RandomRange
    inc eax
    mov bl, al
    mov eax, 20
    call RandomRange
    inc eax
    mov bh, al
    
    movzx eax, bh
    mov edx, 22
    mul edx
    movzx edx, bl
    add eax, edx
    mov esi, OFFSET grid
    add esi, eax
    
    cmp BYTE PTR [esi], 0
    pop ecx
    je PlaceNPC
    loop RetryNPC
    ret
PlaceNPC:
    mov BYTE PTR [esi], 5
    
    mov ecx, 10
    mov esi, OFFSET npcCars
FindSlot:
    cmp BYTE PTR [esi + 4], 0
    je FoundSlot
    add esi, 5
    loop FindSlot
    ret
FoundSlot:
    mov [esi], bl
    mov [esi + 1], bh
    
    mov eax, 4
    call RandomRange
    mov [esi + 2], al
    
    mov BYTE PTR [esi + 3], 1
    mov BYTE PTR [esi + 4], 1
    ret
SpawnNPC endp

UpdateDifficulty proc
    cmp gamemode, 0
    je SkipDifficulty
    
    cmp gpaused, 1
    je SkipDifficulty
    
    inc difftimer
    
    cmp difftimer, 200
    jl SkipDifficulty
    
    mov difftimer, 0
    
    inc difflvl
    
    cmp pType, 0
    je incYellowspeed
    
    cmp rSpeed, 25
    jle SkipSpeedIncrease
    sub rSpeed, 3
    mov eax, rSpeed
    mov gameSpeed, eax
    jmp SkipSpeedIncrease
    
incYellowspeed:
    cmp ySpeed, 15
    jle SkipSpeedIncrease
    sub ySpeed, 3
    mov eax, ySpeed
    mov gameSpeed, eax
    
SkipSpeedIncrease:
    mov ecx, 3
SpawnMoreObs:
    push ecx
    call SpawnObstacle
    pop ecx
    loop SpawnMoreObs
    
    cmp gamemode, 1
    jne EndlessNPC
    mov ecx, 1
    jmp SpawnMoreNPCs
    
EndlessNPC:
    mov ecx, 2
    
SpawnMoreNPCs:
    push ecx
    call SpawnNPC
    pop ecx
    loop SpawnMoreNPCs
    
SkipDifficulty:
    ret
UpdateDifficulty endp

UpdateNPCs proc
    mov ecx, 10
    mov esi, OFFSET npcCars
    
UpdateLoop:
    push ecx
    push esi
    call UpdateOneNPC
    pop esi
    pop ecx
    add esi, 5
    loop UpdateLoop
    ret
UpdateNPCs endp

UpdateOneNPC proc
    cmp BYTE PTR [esi + 4], 0
    je ExitUpdate
    
    movzx ebx, BYTE PTR [esi]
    movzx ecx, BYTE PTR [esi + 1]
    movzx edx, BYTE PTR [esi + 2]
    
    push eax
    push edx
    movzx eax, cl
    push edx
    mov edx, 22
    mul edx
    pop edx
    movzx edi, bl
    add eax, edi
    mov edi, OFFSET grid
    cmp BYTE PTR [edi + eax], 5
    jne SkipClearOld
    mov BYTE PTR [edi + eax], 0
SkipClearOld:
    pop edx
    pop eax
    
    push ebx
    push ecx
    
    cmp dl, 0
    je MoveUp
    cmp dl, 1
    je MoveDown
    cmp dl, 2
    je MoveLeft
    inc bl
    jmp ValidateMove
    
MoveUp:
    dec cl
    jmp ValidateMove
    
MoveDown:
    inc cl
    jmp ValidateMove
    
MoveLeft:
    dec bl
ValidateMove:
    cmp bl, 1
    jl ReverseDirection
    cmp bl, 20
    jg ReverseDirection
    cmp cl, 1
    jl ReverseDirection
    cmp cl, 20
    jg ReverseDirection
    cmp bl, pX
    jne CheckMapCollision
    cmp cl, pY
    je ReverseDirection
   
CheckMapCollision:
    push eax
    push edx
    movzx eax, cl
    push edx
    mov edx, 22
    mul edx
    pop edx
    movzx edi, bl
    add eax, edi
    mov edi, OFFSET grid
    movzx edi, BYTE PTR [edi + eax]
    pop edx
    pop eax
    
    cmp edi, 0
    je MoveValid
    cmp edi, 5
    je MoveValid
    
    jmp ReverseDirection
ReverseDirection:
    pop ecx
    pop ebx
    
    push eax
    movzx eax, dl
    cmp al, 0
    je SetDown
    cmp al, 1
    je SetUp
    cmp al, 2
    je SetRight
    mov al, 2
    jmp UpdateDirection
    
SetDown:
    mov al, 1
    jmp UpdateDirection
    
SetUp:
    mov al, 0
    jmp UpdateDirection
    
SetRight:
    mov al, 3
UpdateDirection:
    mov dl, al
    mov [esi + 2], al
    pop eax
    
    cmp dl, 0
    je MoveUp2
    cmp dl, 1
    je MoveDown2
    cmp dl, 2
    je MoveLeft2
    inc bl
    jmp FinalizeMove
    
MoveUp2:
    dec cl
    jmp FinalizeMove
    
MoveDown2:
    inc cl
    jmp FinalizeMove
    
MoveLeft2:
    dec bl
    jmp FinalizeMove
MoveValid:
    add esp, 8
    jmp FinalizeMove
    
FinalizeMove:
    mov [esi], bl
    mov [esi + 1], cl
    
    push eax
    push edx
    movzx eax, cl
    push edx
    mov edx, 22
    mul edx
    pop edx
    movzx edi, bl
    add eax, edi
    mov edi, OFFSET grid
    
    cmp BYTE PTR [edi + eax], 0
    je PlaceNPCHere
    cmp BYTE PTR [edi + eax], 5
    je PlaceNPCHere
    jmp SkipNPCPlace
    
PlaceNPCHere:
    mov BYTE PTR [edi + eax], 5
    
SkipNPCPlace:
    pop edx
    pop eax
ExitUpdate:
    ret
UpdateOneNPC endp

DrawBoard proc
    mov dh, 0
    mov dl, 0
    call Gotoxy
    mov eax, yellow + (black * 16)
    call SetTextColor
    mov edx, OFFSET mScore
    call WriteString
    mov eax, score
    call WriteDec
    
    mov dh, 0
    mov dl, 20
    call Gotoxy
    mov edx, OFFSET mLevel
    call WriteString
    mov eax, level
    call WriteDec
    
    mov dh, 0
    mov dl, 40
    call Gotoxy
    mov edx, OFFSET mLives
    call WriteString
    mov eax, lives
    call WriteDec
    
    cmp gamemode, 0
    jne SkipTimeDisplay
    
    mov dh, 0
    mov dl, 52
    call Gotoxy
    mov edx, OFFSET mtime1
    call WriteString
    mov eax, totaltime
    call WriteDec
    mov al, 's'
    call WriteChar
    
SkipTimeDisplay:
    
    mov dh, 0
    mov dl, 65
    call Gotoxy
    mov eax, lightCyan + (black * 16)
    call SetTextColor
    mov edx, OFFSET mPass
    call WriteString
    movzx eax, onboard
    call WriteDec
    mov al, '/'
    call WriteChar
    movzx eax, maxP
    call WriteDec
    cmp gamemode, 1
    jne SkipRequiredDisplay
    
    mov dh, 1
    mov dl, 0
    call Gotoxy
    mov eax, lightGreen + (black * 16)
    call SetTextColor
    mov edx, OFFSET mreq
    call WriteString
    mov eax, pdilever
    call WriteDec
    mov al, '/'
    call WriteChar
    mov eax, reqdrop
    call WriteDec
    
SkipRequiredDisplay:
    
    mov edi, 0
DrawAllRows:
    push edi
    call DrawOneRow
    pop edi
    inc edi
    cmp edi, 22
    jl DrawAllRows
    
    call DrawPlayer
    
    mov eax, white + (black * 16)
    call SetTextColor
    ret
DrawBoard endp

DrawOneRow proc
    mov ebx, 0
TopHalf:
    push ebx
    push edi
    call DrawCellTop
    pop edi
    pop ebx
    inc ebx
    cmp ebx, 22
    jl TopHalf
    
    mov ebx, 0
BotHalf:
    push ebx
    push edi
    call DrawCellBottom
    pop edi
    pop ebx
    inc ebx
    cmp ebx, 22
    jl BotHalf
    
    ret
DrawOneRow endp

DrawCellTop proc
    mov eax, edi
    mov ecx, 22
    mul ecx
    add eax, ebx
    mov esi, OFFSET grid
    mov al, [esi + eax]
    
    push eax
    mov eax, ebx
    shl eax, 2
    mov dl, al
    mov eax, edi
    shl eax, 1
    add eax, 2
    mov dh, al
    call Gotoxy
    pop eax
    
    cmp al, 0
    jne CheckBuildT
    call DrawRoadTop
    ret
CheckBuildT:
    cmp al, 1
    jne CheckObsT
    call DrawBuildTop
    ret
CheckObsT:
    cmp al, 2
    jne CheckPassT
    call DrawObsTop
    ret
CheckPassT:
    cmp al, 3
    jne CheckDestT
    call DrawPassTop
    ret
CheckDestT:
    cmp al, 4
    jne CheckNPCT
    call DrawDestTop
    ret
CheckNPCT:
    cmp al, 5
    jne CheckBorderT
    call DrawNPCTop
    ret
CheckBorderT:
    cmp al, 6
    jne CheckBonusT
    call DrawBorderTop
    ret
CheckBonusT:
    cmp al, 7
    jne DefaultT
    call DrawBonusTop
    ret
DefaultT:
    call DrawRoadTop
    ret
DrawCellTop endp

DrawRoadTop proc
    mov eax, black + (white * 16)
    call SetTextColor
    mov al, ' '
    call WriteChar
    call WriteChar
    call WriteChar
    call WriteChar
    ret
DrawRoadTop endp

DrawBuildTop proc
    mov eax, red + (black * 16)
    call SetTextColor
    mov al, '-'
    call WriteChar
    call WriteChar
    call WriteChar
    call WriteChar
    ret
DrawBuildTop endp

DrawBorderTop proc
    mov eax, black + (white * 16)
    call SetTextColor
    mov al, '|'
    call WriteChar
    mov al, ' '
    call WriteChar
    call WriteChar
    mov al, '|'
    call WriteChar
    ret
DrawBorderTop endp

DrawBonusTop proc
    mov eax, black + (yellow * 16)
    call SetTextColor
    mov al, '$'
    call WriteChar
    mov al, '$'
    call WriteChar
    mov al, '$'
    call WriteChar
    mov al, '$'
    call WriteChar
    ret
DrawBonusTop endp

DrawObsTop proc
    mov eax, green + (green * 16)
    call SetTextColor
    mov al, '('
    call WriteChar
    mov al, '^'
    call WriteChar
    call WriteChar
    mov al, ')'
    call WriteChar
    ret
DrawObsTop endp

DrawPassTop proc
    mov eax, white + (magenta * 16)
    call SetTextColor
    mov al, '>'
    call WriteChar
    mov al, '_'
    call WriteChar
    mov al, '_'
    call WriteChar
    mov al, '<'
    call WriteChar
    ret
DrawPassTop endp

DrawDestTop proc
    mov eax, white + (green * 16)
    call SetTextColor
    mov al, 'D'
    call WriteChar
    mov al, 'E'
    call WriteChar
    mov al, 'S'
    call WriteChar
    mov al, 'T'
        call WriteChar
    ret
DrawDestTop endp

DrawNPCTop proc
    mov eax, lightBlue + (lightBlue * 16)
    call SetTextColor
    mov al, " "
    call WriteChar
    call WriteChar
    call WriteChar
    call WriteChar
    ret
DrawNPCTop endp

DrawCellBottom proc
    mov eax, edi
    mov ecx, 22
    mul ecx
    add eax, ebx
    mov esi, OFFSET grid
    mov al, [esi + eax]
    
    push eax
    mov eax, ebx
    shl eax, 2
    mov dl, al
    mov eax, edi
    shl eax, 1
    add eax, 3
    mov dh, al
    call Gotoxy
    pop eax
    
    cmp al, 0
    jne CheckBuildB
    call DrawRoadBot
    ret
CheckBuildB:
    cmp al, 1
    jne CheckObsB
    call DrawBuildBot
    ret
CheckObsB:
    cmp al, 2
    jne CheckPassB
    call DrawObsBot
    ret
CheckPassB:
    cmp al, 3
    jne CheckDestB
    call DrawPassBot
    ret
CheckDestB:
    cmp al, 4
    jne CheckNPCB
    call DrawDestBot
    ret
CheckNPCB:
    cmp al, 5
    jne CheckBorderB
    call DrawNPCBot
    ret
CheckBorderB:
    cmp al, 6
    jne CheckBonusB
    call DrawBorderBot
    ret
CheckBonusB:
    cmp al, 7
    jne DefaultB
    call DrawBonusBot
    ret
DefaultB:
    call DrawRoadBot
    ret
DrawCellBottom endp

DrawBonusBot proc
    mov eax, black + (yellow * 16)
    call SetTextColor
    mov al, '$'
    call WriteChar
    mov al, '$'
    call WriteChar
    mov al, '$'
    call WriteChar
    mov al, '$'
    call WriteChar
    ret
DrawBonusBot endp

DrawRoadBot proc
    mov eax, black + (white * 16)
    call SetTextColor
    mov al, ' '
    call WriteChar
    call WriteChar
    call WriteChar
    call WriteChar
    ret
DrawRoadBot endp

DrawBuildBot proc
    mov eax, red + (black * 16)
    call SetTextColor
    mov al, '-'
    call WriteChar
    call WriteChar
    call WriteChar
    call WriteChar
    ret
DrawBuildBot endp

DrawBorderBot proc
    mov eax, black + (white * 16)
    call SetTextColor
    mov al, '|'
    call WriteChar
    mov al, ' '
    call WriteChar
    call WriteChar
    mov al, '|'
    call WriteChar
    ret
DrawBorderBot endp

DrawObsBot proc
    mov eax, white + (white * 16)
    call SetTextColor
    mov al, '|'
    call WriteChar
    mov eax, brown + (brown * 16)
    call SetTextColor
    call WriteChar
    call WriteChar
    mov eax, white + (white * 16)
    call SetTextColor
    call WriteChar
    ret
DrawObsBot endp

DrawPassBot proc
    mov eax, magenta + (white * 16)
    call SetTextColor
    mov al, '/'
    call WriteChar
    mov eax, white + (magenta * 16)
    call SetTextColor
    mov al, '|'
    call WriteChar
    mov al, '|'
    call WriteChar
    mov eax, magenta + (white * 16)
    call SetTextColor
    mov al, '\'
    call WriteChar
    ret
DrawPassBot endp

DrawDestBot proc
    mov eax, white + (green * 16)
    call SetTextColor
    mov al, 'H'
    call WriteChar
    mov al, 'E'
    call WriteChar
    mov al, 'R'
    call WriteChar
    mov al, 'E'
    call WriteChar
    ret
DrawDestBot endp

DrawNPCBot proc
    mov eax, white + (black * 16)
    call SetTextColor
    mov al, 'O'
    call WriteChar
    
    mov eax, white + (white * 16)
    call SetTextColor
    mov al, " "
    call WriteChar
    call WriteChar
    
    mov eax, white + (black * 16)
    call SetTextColor
    mov al, 'O'
    call WriteChar
    ret
DrawNPCBot endp

DrawPlayer proc
    movzx eax, pX
    shl eax, 2
    mov dl, al
    movzx eax, pY
    shl eax, 1
    add eax, 2
    mov dh, al
    call Gotoxy
    
    mov eax, pColor
    shl eax, 4
    add eax, pColor
    call SetTextColor
    mov al, " "
    call WriteChar
    call WriteChar
    call WriteChar
    call WriteChar
    
    movzx eax, pX
    shl eax, 2
    mov dl, al
    movzx eax, pY
    shl eax, 1
    add eax, 3
    mov dh, al
    call Gotoxy
    
    mov eax, white + (black * 16)
    call SetTextColor
    mov al, 'O'
    call WriteChar
    
    mov eax, white + (white * 16)
    call SetTextColor
    mov al, " "
    call WriteChar
    call WriteChar
    
    mov eax, white + (black * 16)
    call SetTextColor
    mov al, 'O'
    call WriteChar
    ret
DrawPlayer endp

TryPickupOrDrop proc
    mov ecx, 5
    mov esi, OFFSET passengers
    
ChkLoop:
    mov al, [esi + 4]
    cmp al, 2
    je TryDrop
    cmp al, 1
    je TryPickup
    
NextPass:
    add esi, 5
    loop ChkLoop
    ret
TryPickup:
    mov bl, [esi]
    mov bh, [esi + 1]
    mov al, bl
    dec al
    cmp al, pX
    jne CheckRight
    cmp bh, pY
    je  AdjacentOK
    CheckRight:
    mov al, bl
    inc al
    cmp al, pX
    jne CheckUp
    cmp bh, pY
    je  AdjacentOK
    CheckUp:
    mov al, bh
    dec al
    cmp al, pY
    jne CheckDown
    cmp bl, pX
    je  AdjacentOK
    CheckDown:
    mov al, bh
    inc al
    cmp al, pY
    jne NextPass
    cmp bl, pX
    jne NextPass
    AdjacentOK:
    
    mov al, onboard
    cmp al, maxP
    jge MaxCapacity
    
    mov BYTE PTR [esi + 4], 2
    
    inc onboard
    
    movzx eax, bh
    mov edx, 22
    mul edx
    movzx edx, bl
    add eax, edx
    mov edi, OFFSET grid
    mov BYTE PTR [edi + eax], 0
    
    mov bl, [esi + 2]
    mov bh, [esi + 3]
    movzx eax, bh
    mov edx, 22
    mul edx
    movzx edx, bl
    add eax, edx
    mov edi, OFFSET grid
    mov BYTE PTR [edi + eax], 4
    
    mov edx, OFFSET sndPickup
    mov ecx, SND_ASYNC
    call PlaySound
    
    call SpawnPassenger
    ret
MaxCapacity:
    mov dh, 23
    mov dl, 0
    call Gotoxy
    mov eax, red + (black * 16)
    call SetTextColor
    mov edx, OFFSET msgmaxP
    call WriteString
    mov edx, OFFSET sndCarHorn
    mov ecx, SND_ASYNC
    call PlaySound
    ret
TryDrop:
    mov bl, [esi + 2]
    mov bh, [esi + 3]
    cmp bl, pX
    jne NextPass
    cmp bh, pY
    jne NextPass
    
    mov BYTE PTR [esi + 4], 0
    
    dec onboard
    
    inc pdilever
    
    movzx eax, bh
    mov edx, 22
    mul edx
    movzx edx, bl
    add eax, edx
    mov edi, OFFSET grid
    mov BYTE PTR [edi + eax], 0
    
    add score, 10
    
    mov edx, OFFSET sndLevelUp
    mov ecx, SND_ASYNC
    call PlaySound 
    
    mov eax, pdilever
    sub eax, incspeed
    cmp eax, 2
    jl SkipSpeedIncrease
    
    mov eax, pdilever
    mov incspeed, eax
    
    call IncreaseGameSpeed
    
SkipSpeedIncrease:
    cmp gamemode, 1
    jne NotCareerMode
    
    mov eax, pdilever
    cmp eax, reqdrop
    jge CareerComplete
    
NotCareerMode:
    call SpawnPassenger
    ret
    
CareerComplete:
    call GameOver
    ret    
TryPickupOrDrop endp

PlaySound proc
    push eax
    push edx
    mov eax, SND_FILENAME
    or eax, ecx
    invoke PlaySoundA, edx, 0, eax
    pop edx
    pop eax
    ret
PlaySound endp

StopAllSounds proc
    push eax
    invoke PlaySoundA, 0, 0, 0
    pop eax
    ret
StopAllSounds endp


IncreaseGameSpeed proc
    cmp pType, 0
    je IncreaseYellow
    
    cmp rSpeed, 20
    jle SpeedMaxed
    
    sub rSpeed, 10
    mov eax, rSpeed
    mov gameSpeed, eax
    
    mov edx, OFFSET sndTimeWarning
    mov ecx, SND_ASYNC
    call PlaySound
    ret
    
IncreaseYellow:
    cmp ySpeed, 10
    jle SpeedMaxed
    
    sub ySpeed, 10
    mov eax, ySpeed
    mov gameSpeed, eax
    
    mov edx, OFFSET sndTimeWarning
    mov ecx, SND_ASYNC
    call PlaySound
    ret
    
SpeedMaxed:
    ret
IncreaseGameSpeed endp

SpawnPassenger proc
    mov ecx, 5
    mov esi, OFFSET passengers
FindSlot:
    cmp BYTE PTR [esi + 4], 0
    je FoundSlot
    add esi, 5
    loop FindSlot
    ret
FoundSlot:
    push esi
    
    mov edi, 200
TryPickup:
    dec edi
    cmp edi, 0
    je SpawnFailed
    
    mov eax, 20
    call RandomRange
    inc eax
    mov bl, al
    mov eax, 20
    call RandomRange
    inc eax
    mov bh, al
    
    movzx eax, bh
    mov edx, 22
    mul edx
    movzx edx, bl
    add eax, edx
    push edi
    mov edi, OFFSET grid
    cmp BYTE PTR [edi + eax], 0
    pop edi
    jne TryPickup
    mov edi, 200
TryDest:
    dec edi
    cmp edi, 0
    je SpawnFailed
    
    mov eax, 20
    call RandomRange
    inc eax
    mov dl, al
    mov eax, 20
    call RandomRange
    inc eax
    mov dh, al
    
    cmp dl, bl
    jne ChkDest
    cmp dh, bh
    je TryDest
    
ChkDest:
    movzx eax, dh
    push edx
    mov edx, 22
    mul edx
    pop edx
    push edi
    movzx edi, dl
    add eax, edi
    mov edi, OFFSET grid
    cmp BYTE PTR [edi + eax], 0
    pop edi
    jne TryDest
    pop esi
    mov [esi], bl
    mov [esi + 1], bh
    mov [esi + 2], dl
    mov [esi + 3], dh
    mov BYTE PTR [esi + 4], 1
    
    movzx eax, bh
    push edx
    mov edx, 22
    mul edx
    pop edx
    movzx edi, bl
    add eax, edi
    mov edi, OFFSET grid
    mov BYTE PTR [edi + eax], 3
    ret
SpawnFailed:
    pop esi
    ret
SpawnPassenger endp

HandleCollision proc
    cmp al, 7
    je CollectBonus
    cmp al, 1
    je HitObs
    cmp al, 2
    je HitObs
    cmp al, 3
    je HitPas
    cmp al, 5
    je HitNPC
    cmp al, 6
    je HitObs
    ret
CollectBonus:
    add score, 10
    
    mov edx, OFFSET sndBonus
    mov ecx, SND_ASYNC
    call PlaySound
    
    movzx eax, bh
    mov edx, 22
    mul edx
    movzx edx, bl
    add eax, edx
    mov edi, OFFSET grid
    mov BYTE PTR [edi + eax], 0
    
    call SpawnBonusItem
    ret
HitPas:
    mov edx, OFFSET sndCrash
    mov ecx, SND_ASYNC
    call PlaySound
    cmp score, 5
    jl SetZeroPas
    sub score, 5
    jmp DeductLife
SetZeroPas:
    mov score, 0
    jmp DeductLife
HitObs:
    mov edx, OFFSET sndCrash
    mov ecx, SND_ASYNC
    call PlaySound
    cmp pType, 0
    je YellowObs
    
    cmp score, 2
    jl SetZeroObs
    sub score, 2
    jmp DeductLife
    
YellowObs:
    cmp score, 4
    jl SetZeroObs
    sub score, 4
    jmp DeductLife
    
SetZeroObs:
    mov score, 0
DeductLife:
    dec lives
    cmp lives, 0
    jne EndHandle
    call GameOver
    ret
HitNPC:
    mov edx, OFFSET sndCrash
    mov ecx, SND_ASYNC
    call PlaySound
    
    cmp pType, 0
    je YellowNPC
    
    cmp score, 3
    jl SetZeroNPC
    sub score, 3
    jmp DeductLifeNPC
    
YellowNPC:
    cmp score, 2
    jl SetZeroNPC
    sub score, 2
    jmp DeductLifeNPC
    
SetZeroNPC:
    mov score, 0
DeductLifeNPC:
    dec lives
    cmp lives, 0
    jne EndHandle
    call GameOver
    ret
EndHandle:
    ret
HandleCollision endp

DeleteSaveFile proc
    push ebx
    push ecx
    push edx
    
    mov edx, OFFSET savegamefile
    call OpenInputFile
    cmp eax, INVALID_HANDLE_VALUE
    je FileDoesntExist
    
    mov ebx, eax
    call CloseFile
    
    mov edx, OFFSET savegamefile
    call CreateOutputFile
    cmp eax, INVALID_HANDLE_VALUE
    je DeleteFailed
    
    mov ebx, eax
    call CloseFile
    
FileDoesntExist:
    pop edx
    pop ecx
    pop ebx
    mov eax, 1
    ret
    
DeleteFailed:
    pop edx
    pop ecx
    pop ebx
    mov eax, 0
    ret
DeleteSaveFile endp

GameOver proc
     call DeleteSaveFile
    
    mov inprogress, 0
    
    call StopAllSounds
    
    call Clrscr
    
    call drawtitle
    
    cmp gamemode, 1
    jne CheckTimeMode
    
    mov eax, pdilever
    cmp eax, reqdrop
    jge CareerVictory
    jmp LivesLost
    
CheckTimeMode:
    cmp gamemode, 0
    jne CheckEndless
    cmp totaltime, 0
    je TimeUpMessage
    jmp LivesLost
    
CheckEndless:
    jmp LivesLost
    
CareerVictory:
    call StopAllSounds
    mov edx, OFFSET sndGameOver
    mov ecx, SND_SYNC
    call PlaySound
    
    mov eax, green + (yellow * 16)
    call SetTextColor
    mov dh, 20
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mwincareer
    call WriteString
    jmp ShowStats
    
TimeUpMessage:
    call StopAllSounds
    mov edx, OFFSET sndGameOver
    mov ecx, SND_SYNC
    call PlaySound
    
    mov eax, red + (yellow * 16)
    call SetTextColor
    mov dh, 20
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mtime2
    call WriteString
    jmp ShowStats
    
LivesLost:
    call StopAllSounds
    mov edx, OFFSET sndGameOver
    mov ecx, SND_SYNC
    call PlaySound
    
    mov eax, red + (yellow * 16)
    call SetTextColor
    mov dh, 20
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mOver
    call WriteString
    
ShowStats:
    mov eax, black + (yellow * 16)
    call SetTextColor
    mov dh, 22
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mfinal1
    call WriteString
    mov eax, score
    call WriteDec
    
    mov dh, 23
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mfinal2
    call WriteString
    mov eax, pdilever
    call WriteDec
    
    mov dh, 25
    mov dl, 75
    call Gotoxy
    call UpdateLeaderboard
    
    mov dh, 27
    mov dl, 75
    call Gotoxy
    call WaitMsg
    ret
GameOver endp


drawtitle proc
    push eax
    push edx
    
    mov eax, black + (yellow * 16)
    call SetTextColor
    call clrscr
    
    mov dh, 12
    mov dl, 70
    call Gotoxy
    mov edx, OFFSET bl1
    call WriteString
    
    mov dh, 13
    mov dl, 70
    call Gotoxy
    mov edx, OFFSET bl2
    call WriteString
    
    mov dh, 14
    mov dl, 70
    call Gotoxy
    mov eax, red + (yellow * 16)
    call SetTextColor
    mov edx, OFFSET bl3
    call WriteString
    
    mov dh, 15
    mov dl, 70
    call Gotoxy
    mov eax, black + (yellow * 16)
    call SetTextColor
    mov edx, OFFSET bl4
    call WriteString
    
    mov dh, 16
    mov dl, 70
    call Gotoxy
    mov edx, OFFSET bl5
    call WriteString
    
    pop edx
    pop eax
    ret
drawtitle endp

ShowLeaderboard proc
    call Clrscr
    
    call drawtitle
    
    call loadleaderboard
    
    mov eax, black + (yellow * 16)
    call SetTextColor
    mov dh, 19
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET msgl1
    call WriteString
    
    cmp leadcount, 0
    je emptyLeaderboard
    
    xor ecx, ecx
    mov ebx, 21
    
displayL:
    cmp ecx, leadcount
    jge done8
    cmp ecx, 10
    jge done8
    
    push ecx
    push ebx
    
    mov dh, bl
    mov dl, 75
    call Gotoxy
    
    mov eax, black + (yellow * 16)
    call SetTextColor
    pop ebx
    push ebx
    
    mov eax, ecx
    inc eax
    call WriteDec
    mov edx, OFFSET msgl2
    call WriteString
    
    pop ebx
    pop ecx
    push ecx
    push ebx
    
    mov eax, ecx
    mov edx, 20
    mul edx
    mov edx, OFFSET playerNames
    add edx, eax
    call WriteString
    
    mov eax, black + (yellow * 16)
    call SetTextColor
    mov edx, OFFSET msgl3
    call WriteString
    
    pop ebx
    pop ecx
    push ecx
    push ebx
    
    mov eax, [highScores + ecx*4]
    call WriteDec
    mov edx, OFFSET msgl4
    call WriteString
    
    pop ebx
    pop ecx
    inc ebx
    inc ecx
    jmp displayL
    
emptyLeaderboard:
    mov eax, red + (yellow * 16)
    call SetTextColor
    mov dh, 21
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mEmpty
    call WriteString
    
done8:
    mov eax, black + (yellow * 16)
    call SetTextColor
    mov dh, 33
    mov dl, 75
    call Gotoxy
    call WaitMsg
    ret
ShowLeaderboard endp


CheckCollision proc
    movzx eax, bh
    mov ecx, 22
    mul ecx
    movzx edx, bl
    add eax, edx
    mov esi, OFFSET grid
    mov al, [esi + eax]
    
    cmp al, 1
    je RetCol
    cmp al, 2
    je RetCol
    cmp al, 3
    je RetCol
    cmp al, 5
    je RetCol
    cmp al, 6
    je RetCol
    cmp al, 7
    je RetCol
    mov al, 0
    ret
    
RetCol:
    ret
CheckCollision endp

UpdateTimeSystem proc
    cmp gamemode, 0
    jne SkipTimeUpdate
    
    cmp gpaused, 1
    je SkipTimeUpdate
    
    inc currtime
    
    mov eax, currtime
    cmp eax, fps
    jl SkipTimeUpdate
    
    mov currtime, 0
    
    cmp totaltime, 0
    je SkipTimeUpdate
    dec totaltime
    
    cmp totaltime, 0
    jne SkipTimeUpdate
    
    call GameOver
    
SkipTimeUpdate:
    ret
UpdateTimeSystem endp

ShowInstructions proc
    call Clrscr
    
    call drawtitle
    
    mov eax, black + (yellow * 16)
    call SetTextColor
    
    mov dh, 19
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mInst1
    call WriteString
    mov dh, 20
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mInst2
    call WriteString
    mov dh, 21
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mInst3
    call WriteString
    mov dh, 22
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mInst4
    call WriteString
    mov dh, 23
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mInst5
    call WriteString
    mov dh, 24
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mInst6
    call WriteString
    mov dh, 25
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mInst7
    call WriteString
    mov dh, 26
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mInst8
    call WriteString
    mov dh, 27
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mInst9
    call WriteString
    mov dh, 28
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mInst10
    call WriteString
    mov dh, 29
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mInst11
    call WriteString
    mov dh, 30
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mInst12
    call WriteString
    mov dh, 31
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mInst13
    call WriteString
    mov dh, 32
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mInst14
    call WriteString
    mov dh, 33
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mInst15
    call WriteString
    mov dh, 34
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mInst16
    call WriteString
    mov dh, 35
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mInst17
    call WriteString
    mov dh, 36
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mInst18
    call WriteString
    
    mov dh, 38
    mov dl, 75
    call Gotoxy
    call WaitMsg
    ret
ShowInstructions endp


MenuLoop proc
Menu:
    mov edx, OFFSET sndMenuMusic
    mov ecx, SND_ASYNC or SND_LOOP
    call PlaySound
    
    call Clrscr
    call drawtitle
    
    mov eax, black + (yellow * 16)
    call SetTextColor

    mov dh, 20
    mov dl, 90
    call Gotoxy
    mov edx, OFFSET menu1
    call WriteString
    
    mov dh, 21
    mov dl, 90
    call Gotoxy
    mov edx, OFFSET menu2
    call WriteString
    
    mov dh, 22
    mov dl, 90
    call Gotoxy
    mov edx, OFFSET menu3
    call WriteString
    
    mov dh, 23
    mov dl, 90
    call Gotoxy
    mov edx, OFFSET menu4
    call WriteString
    
    mov dh, 24
    mov dl, 90
    call Gotoxy
    mov edx, OFFSET menu5
    call WriteString
    
    mov dh, 25
    mov dl, 90
    call Gotoxy
    mov eax, red + (yellow * 16)
    call SetTextColor
    mov edx, OFFSET menu6
    call WriteString
    
    mov dh, 27
    mov dl, 90
    call Gotoxy
    mov eax, black + (yellow * 16)
    call SetTextColor
    mov edx, OFFSET menu7
    call WriteString
    call ReadChar
    call WriteChar
    
    cmp al, '1'
    je InputName
    cmp al, '2'
    je ContinueGame
    cmp al, '3'
    je ChangeDiff
    cmp al, '4'
    je Leaderboard
    cmp al, '5'
    je Instructions
    cmp al, '6'
    je ExitGame
    jmp Menu
ContinueGame:
    call loadgamestate
    cmp eax, 1
    je LoadSuccess
    
    call Clrscr
    call drawtitle
    
    mov eax, red + (yellow * 16)
    call SetTextColor
    mov dh, 18
    mov dl, 77
    call Gotoxy
    mov edx, OFFSET mnosaved
    call WriteString
    
    mov dh, 21
    mov dl, 77
    call Gotoxy
    call WaitMsg
    jmp Menu
    
LoadSuccess:
    mov inprogress, 1
    
    mov gpaused, 0
    
    call Clrscr
    mov edx, OFFSET ansiHideCursor
    call WriteString
    ret    
Leaderboard:
    call ShowLeaderboard
    jmp Menu
Instructions:
    call ShowInstructions
    jmp Menu
InputName:
    call SelectGameMode
    call Clrscr
    call drawtitle
    
    mov eax, black + (yellow * 16)
    call SetTextColor
    mov dh, 20
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mname
    call WriteString
    mov edx, OFFSET playerName
    mov ecx, 19
    call ReadString
    call SelectTaxiColor
    jmp StartGame
ChangeDiff:
    call Clrscr
    call drawtitle
    
    mov eax, black + (yellow * 16)
    call SetTextColor
    mov dh, 20
    mov dl, 75
    call Gotoxy
    mov edx, OFFSET mdifficult
    call WriteString
    call ReadChar
    sub al, '0'
    cmp al, 1
    jl Menu
    cmp al, 3
    jg Menu
    cmp al, 1
    je Lvl1
    cmp al, 2
    je Lvl2
    
    mov level, 3
    cmp pType, 0
    je HardYellow
    mov rSpeed, 25
    mov eax, rSpeed
    mov gameSpeed, eax
    jmp Menu
HardYellow:
    mov ySpeed, 15
    mov eax, ySpeed
    mov gameSpeed, eax
    jmp Menu
    
Lvl1:
    mov level, 1
    cmp pType, 0
    je EasyYellow
    mov rSpeed, 55
    mov eax, rSpeed
    mov gameSpeed, eax
    jmp Menu
EasyYellow:
    mov ySpeed, 35
    mov eax, ySpeed
    mov gameSpeed, eax
    jmp Menu
    
Lvl2:
    mov level, 2
    cmp pType, 0
    je MediumYellow
    mov rSpeed, 40
    mov eax, rSpeed
    mov gameSpeed, eax
    jmp Menu
MediumYellow:
    mov ySpeed, 25
    mov eax, ySpeed
    mov gameSpeed, eax
    jmp Menu
StartGame:
    mov inprogress, 1
    
    call Clrscr
    mov edx, OFFSET mWelcome
    call WriteString
    call Crlf
    call InitializeMap
    call Clrscr
    mov edx, OFFSET ansiHideCursor
    call WriteString
    ret
MenuLoop endp

main proc
    call Randomize
    call MenuLoop
    call StopAllSounds
GameLoop:
    cmp inprogress, 0
    je gotomenu
    
    call DrawBoard
    call UpdateNPCs
    call UpdateDifficulty
    call UpdateTimeSystem
    
    mov eax, gameSpeed
    call Delay
    call ReadKey
    jz GameLoop
    
    cmp dx, VK_ESCAPE
    je HandleEscape
    jmp nxt
    
HandleEscape:
    cmp inprogress, 1
    jne gotomenu
    
    call gamestateSave
    
gotomenu:
    call MenuLoop
    jmp GameLoop
nxt:
    cmp al, ' '
    je HandleSpace
    cmp dx, VK_UP
    je MoveUp
    cmp dx, VK_DOWN
    je MoveDown
    cmp dx, VK_LEFT
    je MoveLeft
    cmp dx, VK_RIGHT
    je MoveRight
    cmp al, 'p'
    je PauseGame
    cmp al, 'P'
    je PauseGame
    jmp GameLoop
HandleSpace:
    call TryPickupOrDrop
    jmp GameLoop
MoveUp:
    mov bl, pX
    mov bh, pY
    dec bh
    call CheckCollision
    cmp al, 0
    je SafeUp
    call HandleCollision
    jmp GameLoop
SafeUp:
    dec pY
    jmp GameLoop
MoveDown:
    mov bl, pX
    mov bh, pY
    inc bh
    call CheckCollision
    cmp al, 0
    je SafeDown
    call HandleCollision
    jmp GameLoop
SafeDown:
    inc pY
    jmp GameLoop
MoveLeft:
    mov bl, pX
    mov bh, pY
    dec bl
    call CheckCollision
    cmp al, 0
    je SafeLeft
    call HandleCollision
    jmp GameLoop
SafeLeft:
    dec pX
    jmp GameLoop
MoveRight:
    mov bl, pX
    mov bh, pY
    inc bl
    call CheckCollision
    cmp al, 0
    je SafeRight
    call HandleCollision
    jmp GameLoop
SafeRight:
    inc pX
    jmp GameLoop
PauseGame:
    xor gpaused, 1
    mov edx, OFFSET sndCarHorn
    mov ecx, SND_ASYNC
    call PlaySound
    
    mov dh, 23
    mov dl, 0
    call Gotoxy
    
    cmp gpaused, 1
    je ShowPaused
    
    mov eax, black + (black * 16)
    call SetTextColor
    mov ecx, 30
ClearPauseMsg:
    mov al, ' '
    call WriteChar
    loop ClearPauseMsg
    jmp GameLoop
    
ShowPaused:
    mov eax, lightCyan + (black * 16)
    call SetTextColor
    mov edx, OFFSET mPaused
    call WriteString
    
WaitForResume:
    call ReadKey
    jz WaitForResume
    
    cmp al, 'p'
    je ResumeGame
    cmp al, 'P'
    je ResumeGame
    
    jmp WaitForResume
ResumeGame:
    xor gpaused, 1
    
    mov dh, 23
    mov dl, 0
    call Gotoxy
    mov eax, black + (black * 16)
    call SetTextColor
    mov ecx, 30
    ClearPauseMsg2:
    mov al, ' '
    call WriteChar
    loop ClearPauseMsg2
    jmp GameLoop
    
ExitGame::
    exit
main endp
end main