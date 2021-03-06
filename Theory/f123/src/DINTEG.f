       FUNCTION DINTEG (F, ALFA, BETA, EPS)
       IMPLICIT DOUBLE PRECISION (A-H, O-Z)
       DIMENSION W(12), X(12)
       DATA CONST / 1.0 D-12 /
       DATA W
     1  /0.101228536290376d0, 0.222381034453374d0, 0.313706645877887d0,
     2   0.362683783378362d0, 0.027152459411754d0, 0.062253523938647d0,
     3   0.095158511682492d0, 0.124628971255533d0, 0.149595988816576d0,
     4   0.169156519395002d0, 0.182603415044923d0, 0.189450610455068d0/
       DATA X
     1  /0.960289856497536d0, 0.796666477413627d0, 0.525532409916329d0,
     2   0.183434642495650d0, 0.989400934991649d0, 0.944575023073232d0,
     3   0.865631202387831d0, 0.755404408355003d0, 0.617876244402643d0,
     4   0.458016777657227d0, 0.281603550779258d0, 0.095012509837637d0/
       DINTEG = 0.0 D0
       IF ( ALFA . EQ. BETA ) RETURN
       A = ALFA
       B = BETA
       DELTA = CONST * (DABS(A-B))
       AA = A
    1  Y = B - AA
       IF( DABS(Y) .LE. DELTA ) RETURN
    2  BB = AA + Y
       C1 = 0.5 D0 * (AA + BB)
       C2 = C1 - AA
       S8 = 0.0 D0
       S16 = 0.0 D0
       DO 15 I = 1, 4
          C3 = X(I) * C2
          S8 = S8 + W(I) * (F(C1+C3)+F(C1-C3))
   15  CONTINUE
       DO 16 I = 5, 12
          C3 = X(I) * C2
          S16 = S16 + W(I) * (F(C1+C3)+F(C1-C3))
  16   CONTINUE
       S8 = S8 * C2
       S16= S16 * C2
       IF( DABS(S16-S8) .GT. EPS * DABS(S8)) THEN
          Y = 0.5 * Y
          IF ( DABS(Y) .LE. DELTA ) THEN
             DINTEG = 0.0
             WRITE (*,10)
c             write(6,*) c1+c3, c1-c3
  10         FORMAT (1X,' DINTEG : TOO HIGH ACCURACY ')
          ELSE
             GOTO 2
          END IF
       ELSE
          DINTEG = DINTEG + S16
          AA = BB
          GOTO 1
       END IF
       RETURN
       END
