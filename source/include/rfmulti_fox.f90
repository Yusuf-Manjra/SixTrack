
!---- Zero the arrays

irrtr = irm_rf(ix)
nordm=nmu_rf(irrtr)
crabfreq = freq_rfm(irrtr)*c1e3

!FOX  KCRABDA=(SIGMDA/(CLIGHT*(E0F/E0))
!FOX  *CRABFREQ*2D0*PI) ;

!FOX  DXRF=XL*C1M3 ;
!FOX  DYRF=ZL*C1M3 ;

do iord = 1, nordm
!FOX  FCODA(1, IORD)=((NORRFAMP(IRRTR, IORD)*QQ0)*
!FOX  COS(NORRFPH(IRRTR, IORD)*2D0*PI  - KCRABDA)) ;

!FOX  FSIDA(1, IORD)=((NORRFAMP(IRRTR, IORD)*QQ0)*
!FOX  SIN(NORRFPH(IRRTR, IORD)*2D0*PI  - KCRABDA)) ;

!FOX  FCODA(2, IORD)=((SKRFAMP(IRRTR, IORD)*QQ0)*
!FOX  COS(SKRFPH(IRRTR, IORD)*2D0*PI  - KCRABDA)) ;

!FOX  FSIDA(2, IORD)=((SKRFAMP(IRRTR, IORD)*QQ0)*
!FOX  SIN(SKRFPH(IRRTR, IORD)*(2D0*PI)  - KCRABDA)) ;

enddo

!FOX  CP_RE=ZERO ;
!FOX  CP_IM=ZERO ;
!FOX  SP_RE=ZERO ;
!FOX  SP_IM=ZERO ;

do iord = nordm, 1, -1
!FOX  CP_RETP = CP_RE ;
!FOX  CP_RE=(CP_RETP*DXRF - CP_IM*DYRF)/(IORD)  + FCODA(1, IORD) ;
!FOX  CP_IM=(CP_RETP*DYRF + CP_IM*DXRF)/(IORD)  + FCODA(2, IORD) ;

!FOX  SP_RETP = SP_RE ;
!FOX  SP_RE=(SP_RETP*DXRF - SP_IM*DYRF)/(IORD+1)  + FSIDA(1, IORD) ;
!FOX  SP_IM=(SP_RETP*DYRF + SP_IM*DXRF)/(IORD+1)  + FSIDA(2, IORD) ;
enddo

!FOX  XL=(X(1)-XS)*TILTC(I)+(X(2)-ZS)*TILTS(I) ;
!FOX  ZL=-(X(1)-XS)*TILTS(I)+(X(2)-ZS)*TILTC(I) ;

!FOX  SP_RETP = SP_RE ;
!FOX  SP_RE=(SP_RETP*DXRF - SP_IM*DYRF) ;
!FOX  SP_IM=(SP_RETP*DYRF + SP_IM*DXRF) ;

!FOX  Y(1)=Y(1) - (CP_RE*C1E3*TILTC(I) +
!FOX  CP_IM*C1E3*TILTS(I))*(MTCDA/(ONE+DPDA)) ;
!FOX
!FOX  Y(2)=Y(2) + (-CP_RE*C1E3*TILTS(I) +
!FOX  CP_IM*C1E3*TILTC(I))*(MTCDA/(ONE+DPDA)) ;

!FOX  EJ1 = EJ1 - (C1E3*E0F*SP_RE*CRABFREQ*2D0*PI)
!FOX  /(CLIGHT) ;

!FOX  EJF0=EJF1 ;
!FOX  EJF1=SQRT(EJ1*EJ1-NUCMDA*NUCMDA) ;
!FOX  DPDA1=(EJF1-E0F)/E0F*C1E3 ;

!FOX  RV=EJ1/E0*E0F/EJF1 ;
!FOX  DPDA=DPDA1*C1M3 ;
!FOX  MOIDA=MTCDA/(ONE+DPDA) ;
!FOX  Y(1)=EJF0/EJF1*Y(1) ;
!FOX  Y(2)=EJF0/EJF1*Y(2) ;
