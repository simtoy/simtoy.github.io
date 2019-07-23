#!user/bin/perl
#It's a programming language for AI!
#---------------OUR_ARGU---------------#
our $ip=0;
our $MOD;
our $POS=0;
our $TmpPos;
our %VARPOOL=('CTRL'=>'CAIXUKUN'); #FUNNY CONSTANT!!!
our %INFO=('CTRL.num'=>'CAIXUKUN');
our %The_Names_Of_Cycle=('CTRL.mod'=>'CAIXUKUN');
our $TIME;
our $HEN;
our $CMod;
our $T;
our $Cntr=0;
our $Sin;
our $BMOD;
our $BNAME;
our $MMod;
our $q=0;
our $MCHAR;
our $cNtr=0;
our $Main=0;
our $Maino=0;
#----------------MAIN_SUB---------------
open DATA,<STDIN>;#All lines was saved in this list!
our @DATA=<DATA>;
for($q=0;$q<@DATA;$q+=1){
if(index($DATA[$q],":>") != -1){
$TmP=Kan($DATA[$q]);
$DATA[$q]=~ s/:>/->$TmP/;
}
}
$Tmo=join("->",@DATA);
@DATA=split("->",$Tmo);
Run($DATA[0]);
<STDIN>;
#---------------BRACKERTER--------------#
sub Bra{
	my $M_CODE=$_[0];
	my $F_CHAR=$_[1];
	my $E_CHAR=$_[2];
	my @M_CODE=split(//,$M_CODE);
	my $CNTR;
	my $S_C;
	my $ALL;
	for($i=1;$i<@M_CODE;$i+=1){
		if(index(@M_CODE[$i],$F_CHAR) ne -1){
			$CNTR+=1;
			$S_C+=1;
			$ALL+=1;
		}
		elsif(index(@M_CODE[$i],$E_CHAR) ne -1){
			$CNTR-=1;
			$S_C+=1;
			$ALL+=1;
		}
		else{
			$ALL+=1;
		}
		if($S_C > 0 && $CNTR == 0){
			return $ALL;
		}
	}
}
#--------------MIDER-------------------#
sub Mid{
	my $STR=$_[0];
	return substr($STR,index($STR,"(")+1,Bra($STR,"(",")")-index($STR,"(")-1);
}
#--------------Mioer----------------------#
sub Mio{
	my $STR=$_[0];
	return substr($STR,index($STR,"<")+1,Bra($STR,"<",">")-index($STR,"<")-1);
}
#----------LINE_FINDER---------------#
sub Fin{
   	my $Target=$_[0];
	for($w=0;$w<@DATA;$w+=1){
		if(index($DATA[$w],$Target) != -1){
			return $w;
		}
	}
}
#------------LRACKETER---------------#
sub Lra{
	my $F_CHAR=$_[0];
	my $E_CHAR=$_[1];
	my $SOP=$POS; #Temple position...
	my $S_C=0;
	my $CNTR=0;
	my $BOOL=1;
	while($BOOL==1){
		if(index($DATA[$SOP],$F_CHAR) == -1 && index($DATA[$SOP],$E_CHAR) == -1){
			
			$SOP+=1;
			
		}
		elsif(index($DATA[$SOP],$F_CHAR) != -1){
			
			$CNTR+=1;
			$S_C+=1;
			$SOP+=1;
			
		}
		elsif(index($DATA[$SOP],$E_CHAR) != -1){
			
			$CNTR-=1;
			$S_C+=1;
			$SOP+=1;
			
		}

		if($S_C>0 && $CNTR == 0){
			return $SOP-1;
			$BOOL=0;
		}
	}
}
#-------------TOKENR-------------------#
sub Tok{
	my $LINE=$_[0];
	my $CHAR;
	my $CNTR=0;
	my $AFTR;
    for($i=0;$i<length($LINE);$i+=1){
    	$CHAR=substr($LINE,$i,1);
    	if($CHAR eq "("){
    		$CNTR+=1;
    	}
    	if($CHAR eq ")"){
    		$CNTR-=1;
    	}
    	if($CHAR eq "," && $CNTR==0){
    		$CHAR="%%";
    	}
    	$AFTR=$AFTR.$CHAR;
    }
    @INNER=split("%%",$AFTR);
    return @INNER;
}
#-------------Kanbun-------------------#
sub Kan{
my $RET='';
my $CNTR=0;
my $CH;
$BUN=$_[0];
if(index($BUN,"(") != -1){
@BUN=split(//,$BUN);
foreach $CH(@BUN){
if($CH eq "("){$CNTR=1;}
$RET=$RET.$CH;
if($CNTR==1){$RET=~ s/\(//;return $RET;}
}
}else{return $BUN;}
}
#-------------RUNNER-------------------#
sub Run{
	my @SAN;
	my $TMP;
	my $CODE=$_[0];
	if(index($CODE,"bark(") != -1){
		$SAN=San(Mid($CODE));
		print $SAN;
		$POS=$POS+1;
		Run($DATA[$POS]);
	}
	if(index($CODE,"say(") ne -1){
		@SAN=Tok(Mid($CODE));
		$SAN[0]=San($SAN[0]);
		$SAN[1]=San($SAN[1]);
		if($BMOD==1){
		if($MMod==1){
   	    $SAN[0]=~ s/me./$BNAME$MCHAR/;
	    }else{
	    $SAN[0]=~ s/me./$BNAME:/;
	    }
		$VARPOOL{"$SAN[0]"}="$SAN[1]";
		}else{
		$VARPOOL{"$SAN[0]"}="$SAN[1]";}
		$POS=$POS+1;Run($DATA[$POS]);
   }
   if(index($CODE,"sin(") != -1){
   $SAN=San(Mid($CODE));
      	    if($SAN == 1){
   	    	$POS=$POS+1;
   	    	Run($DATA[$POS]);
   	    }
   	    if($SAN == 2){
   	    	$POS=Lra("sin","nis.")+1;
   	    	Run($DATA[$POS]);
   	    }
	}
	if(index($CODE,"nis.") != -1){
	$POS=$POS+1;
   	Run($DATA[$POS]);
	}
   if(index($CODE,"if(") != -1){
   	    $SAN=Mid($CODE);
   	    $SAN=San($SAN);
   	    if($SAN == 1){
   	    	$POS=$POS+1;
   	    	Run($DATA[$POS]);
   	    }
   	    if($SAN == 2){
   	    	$POS=Lra("if","else.")+1;
   	    	Run($DATA[$POS]);
   	    }
   }
   if(index($CODE,"else.") != -1){
   	       $POS=Lra("else.","fi.");
   	       Run($DATA[$POS]);
   }
   if(index($CODE,"fi.") != -1){
   	        $POS+=1;Run($DATA[$POS]);
   }
   if(index($CODE,"orp.") != -1){
   	        $POS=$TmpPos;Run($DATA[$POS]);
   }
   if(index($CODE,"jump.") != -1){
   	        $POS+=1;Run($DATA[$POS]);
   }
   if(index($CODE,"goto(") != -1){
		$SAN=(Mid($CODE));
		$SAN=San($SAN);
		$POS=$SAN;
		Run($DATA[$POS]);
   }
   if(index($CODE,"pro(") != -1){
   	   $SAN=Mid($CODE);
	   if($BMOD==1){
	   if($MMod==1){
   	   $SAN=~ s/$TmpName:/$BNAME$MCHAR/;
	   
	   }else{
	   $SAN=~ s/me./$BNAME:/;
	   }
	   $DATA[$POS]="pro(".$SAN.")";
	   }else{
	   $Function_Name=San($SAN);}
   	   $POS=Lra("pro","orp.")+1;
      
   	   Run($DATA[$POS]);
   	   
   }
   if(index($CODE,"go(") != -1){
   	  @SAN=Tok(Mid($CODE));
   	  
   	  $w=0;
   	  for($i=1;$i<@SAN;$i+=1){
   	  	$w+=1;

   	  	$VARPOOL{"$SAN[0].$w"}=San($SAN[$i]);
}
   	  $TmpPos=$POS+1;
   	  $POS=Fin("pro(".$SAN[0])+1;
   	  Run($DATA[$POS]);
   }
   if(index($CODE,"send(") != -1){
   	  $SAN=Mid($CODE);
   	  $VARPOOL{$Function_Name.".back"}=San($SAN);
   	 
   }
   if(index($CODE,"cy(")!=-1){
   @SAN=Tok(Mid($CODE));
   $Main=$Main+1;
   $INFO{"$Main"."Time"}=San($SAN[0]);
   $INFO{"$Main"."Var"}=$SAN[1];
   $INFO{"$Main"."Step"}=San($SAN[2]);
   $INFO{"$Main"."Mod"}=$VARPOOL{$SAN[1]};
   $INFO{"$Main"."Tem"}=$POS+1;
   $POS+=1;
   Run($DATA[$POS]);
   }
   if(index($CODE,"yc.")!=-1){
   if($INFO{"$Main"."Mod"}!=$INFO{"$Main"."Time"}){
   $INFO{"$Main"."Mod"}+=$INFO{"$Main"."Step"};
   $VARPOOL{$INFO{"$Main"."Var"}}=$INFO{"$Main"."Mod"};
   $POS=$INFO{"$Main"."Tem"};
   Run($DATA[$POS]);}
   else{
   $VARPOOL{$INFO{"$Main"."Var"}}=$INFO{"$Main"."Mod"};
   $Main-=1;
   $POS+=1;Run($DATA[$POS]);}
   }
   
   if(index($CODE,"im(") != -1){
   @SAN=Tok(Mid($CODE));
   $Main=$Main+1;
   $INFO{"$Maino"."Time"}=San($SAN[0]);
   $INFO{"$Maino"."Var"}=$SAN[1];
   $INFO{"$Maino"."Step"}=San($SAN[2]);
   $INFO{"$Maino"."Mod"}=$VARPOOL{$SAN[1]};
   $INFO{"$Maino"."Tem"}=$POS+1;
   $POS+=1;
   Run($DATA[$POS]);
   }
   
   if(index($CODE,"mi.") != -1){
   if(San($INFO{"$Maino"."Time"})==1){
   $INFO{"$Maino"."Mod"}+=$INFO{"$Maino"."Step"};
   $VARPOOL{$INFO{"$Maino"."Var"}}=$INFO{"$Maino"."Mod"};
   $POS=$INFO{"$Maino"."Tem"};
   Run($DATA[$POS]);}
   else{
   $VARPOOL{$INFO{"$Maino"."Var"}}=$INFO{"$Maino"."Mod"};
   $Main-=1;
   $POS+=1;Run($DATA[$POS]);}
   }
   
   if(index($CODE,"cab(") != -1){
   @SAN=Tok(Mid($CODE));
   $VARPOOL{"$SAN[0]"."T"."num"}=@SAN-1;
   $ele=$SAN[0];
   for($i=1;$i<@SAN;$i+=1){
   $duang=San($SAN[$i]);
   $VARPOOL{"$ele"."T"."$i"}=$duang;
   }
   $POS+=1;Run($DATA[$POS]);
   }
   if(index($CODE,"put(") != -1){
   @SAN=Tok(Mid($CODE));
   $VARPOOL{San($SAN[0])."T".San($SAN[1])}=San($SAN[2]);
   $POS+=1;Run($DATA[$POS]);
   }
   if(index($CODE,"move(") != -1){
   @SAN=Tok(Mid($CODE));
   for($i=0;$i<$VARPOOL{"$SAN[0]"."T"."num"}-$SAN[1];$i+=1){
   $q=$SAN[1]+$i;
   $w=$q+1;
   $VARPOOL{"$SAN[0]"."T"."$q"}=$VARPOOL{"$SAN[0]"."T"."$w"};
   }
   $SAIDAI=$VARPOOL{"$SAN[0]"."T"."num"};
   $VARPOOL{$SAN[0]."T"."$SAIDAI"}='';
   $POS=$POS+1;Run($DATA[$POS]);
   }
   if(index($CODE,"movef(") != -1){
   @SAN=Tok(Mid($CODE));
   $SAN[1]=1;
   for($i=0;$i<$VARPOOL{"$SAN[0]"."T"."num"}-$SAN[1];$i+=1){
   $q=$SAN[1]+$i;
   $w=$q+1;
   $VARPOOL{"$SAN[0]"."T"."$q"}=$VARPOOL{"$SAN[0]"."T"."$w"};
   }
   $SAIDAI=$VARPOOL{"$SAN[0].num"};
   $VARPOOL{$SAN[0]."T"."$SAIDAI"}='';
   $POS=$POS+1;Run($DATA[$POS]);
   }
   if(index($CODE,"moveb(") != -1){
   @SAN=Tok(Mid($CODE));
   $SAN[1]=$VARPOOL{"$SAN[0]"."T"."num"};
   for($i=0;$i<$VARPOOL{"$SAN[0]"."T"."num"}-$SAN[1];$i+=1){
   $q=$SAN[1]+$i;
   $w=$q+1;
   $VARPOOL{"$SAN[0]"."T"."$q"}=$VARPOOL{"$SAN[0]"."T"."$w"};
   }
   $SAIDAI=$VARPOOL{"$SAN[0]"."T"."num"};
   $VARPOOL{$SAN[0]."T"."$SAIDAI"}='';
   $POS=$POS+1;Run($DATA[$POS]);
   }
   if(index($CODE,"clone(") != -1){
   @SAN=Tok(Mid($CODE));
   for($i=1;$i<$VARPOOL{"$SAN[0]"."T"."num"};$i+=1){
   $VARPOOL{San($SAN[0])."T".$i}=$VARPOOL{San($SAN[1])."T".$i};
   }
   	$POS=$POS+1;Run($DATA[$POS]);
   }
   if(index($CODE,"pm()") != -1){
   print "Hello my name is PM";
   }
   if(index($CODE,"box(")!=-1){
   
   }
   if(index($CODE,"xob.")!=-1){
   
   }
   if(index($CODE,"inherit(")!=-1){
   
   }
   if(index($CODE,"make(")!=-1){
   
   }
}
#------------SANNER------------------#
sub San{
	my $CODE=$_[0];
	my $IMF=Kan($CODE);
	my @SAN;
	if($IMF =~ /&/){
	$CODE=~ s/&//;
	return $VARPOOL{"$CODE"};
	}
	elsif(index($CODE,"<") != -1 && index($CODE,">") != -1){
    @SAN=Tok(Mio($CODE));
    $tmp='';
    foreach $re(@SAN){
    $r=San($re);
    $tmp=$tmp.$r;
    }
    return $tmp;
    }
    elsif($IMF eq "e"){
   	 @SAN=Tok(Mid($CODE));
   	 $SAN[0]=San($SAN[0]);
   	 $SAN[1]=San($SAN[1]);
	  if($SAN[0] == $SAN[1] or $SAN[0] eq $SAN[1]){
	  	return 1;
	  	}else{
	  	return 2;
	  	}
   }
    elsif($IMF eq "o"){
   	 @SAN=Tok(Mid($CODE));
   	 $SAN[0]=San($SAN[0]);
   	 $SAN[1]=San($SAN[1]);
	  if($SAN[0]==1 || $SAN[1]==1){
	  	return 1;
	  	}else{
	  	return 2;
	  	}
   }
    elsif($IMF eq "n"){
   	 @SAN=Tok(Mid($CODE));
   	 $SAN[0]=San($SAN[0]);
   	 $SAN[1]=San($SAN[1]);
	  if($SAN[0]==1 && $SAN[1]==1){
	  	return 1;
	  	}else{
	  	return 2;
	  	}
   }
    elsif($IMF eq "!"){
   	 $SAN=Mid($CODE);
   	 $SAN=San($SAN);
	  if($SAN==2){
	  	return 1;
	  	}else{
	  	return 2;
	  	}
   }
    elsif($IMF eq "!e"){
   	 $SAN=Mid($CODE);
   	 $SAN=San($SAN);
	  if($SAN[0] == $SAN[1] or $SAN[0] eq $SAN[1]){
	  	return 2;
	  	}else{
	  	return 1;
	  	}
   }
   elsif($IMF eq "g"){
   	@SAN=Tok(Mid($CODE));
   	$w=0;
   	for($i=1;$i<@SAN;$i+=1){
   	$w+=1;
   	$VARPOOL{"$SAN[0].$w"}="$SAN[$i]";
   	}
   	$TmpPos=$POS+1;
   	$POS=Fin("Pro(".$SAN[0])+1;
   	Run($DATA[$POS]);
   	return $VARPOOL{$Function_Name.".Back"};
   }
   elsif($IMF eq "&"){
	$SAN=Mid($CODE);
	$SAN=San($SAN);
	return $VARPOOL{"$SAN"};
   }

   elsif($IMF eq "@"){ #False syntax sugar of & (Just for Array).
     @SAN=Tok(Mid($CODE));
	 $a=San($SAN[0]);
	 $b=San($SAN[1]);
     return $VARPOOL{"$a"."T"."$b"};
   }
   
   elsif($IMF eq "get"){
   $Stdin=<STDIN>;
   $Stdin=~ s/\n//;#Kill endl!
   	return $Stdin;
   }
   elsif($CODE eq "\n"){
   	return "\n";
   }
   elsif($IMF eq "isRt"){
   @SAN=Tok(Mid($CODE));$gou=San($SAN[0]);$gu=San($SAN[1]);$xian=San($SAN[2]);
   if($gou**2+$gu**2==$xian**2){return 1;}else{return 2;}
   }
   elsif($IMF eq "."){

   }
   elsif($IMF eq "isLeap"){
   $SAN=San(Mid($CODE));
   if(abs(2016-$SAN)%4==0){return 1;}else{return 2;}
   }
   elsif($IMF eq "+"){
   @SAN=Tok(Mid($CODE));
   $re=$SAN[0];shift(@SAN);
   foreach $t(@SAN){$t=San($t);$re+=$t;}
   return $re;
   }
   elsif($IMF eq "-"){
   @SAN=Tok(Mid($CODE));
   $re=$SAN[0];shift(@SAN);
   foreach $t(@SAN){$t=San($t);$re-=$t;}
   return $re;
   }
   elsif($IMF eq "*"){
   @SAN=Tok(Mid($CODE));
   $re=$SAN[0];shift(@SAN);
   foreach $t(@SAN){$t=San($t);$re=$re*$t;}
   return $re;
   }
   elsif($IMF eq '/'){
   @SAN=Tok(Mid($CODE));
   $re=$SAN[0];shift(@SAN);
   foreach $t(@SAN){$t=San($t);$re=$re/$t;}
   return $re;
   }
   elsif($IMF eq "\\"){
   @SAN=Tok(Mid($CODE));
   $re=$SAN[0];shift(@SAN);
   foreach $t(@SAN){$t=San($t);$re=$re%$t;}
   return $re;
   }
   elsif($IMF eq "^"){
   @SAN=Tok(Mid($CODE));
   return $SAN[0]**$SAN[1];     
   }
    elsif($IMF eq ">"){
   	 @SAN=Tok(Mid($CODE));
   	 $SAN[0]=San($SAN[0]);
   	 $SAN[1]=San($SAN[1]);
	  if($SAN[0] > $SAN[1]){
	  	return 1;
	  	}else{
	  	return 2;
	  	}
   }
    elsif($IMF eq "<"){
   	 @SAN=Tok(Mid($CODE));
   	 $SAN[0]=San($SAN[0]);
   	 $SAN[1]=San($SAN[1]);
	  if($SAN[0] < $SAN[1]){
	  	return 1;
	  	}else{
	  	return 2;
	  	}
   }
    elsif($IMF eq ">e"){
   	 @SAN=Tok(Mid($CODE));
   	 $SAN[0]=San($SAN[0]);
   	 $SAN[1]=San($SAN[1]);
	  if($SAN[0] <= $SAN[1]){
	  	return 1;
	  	}else{
	  	return 2;
	  	}
   }
    elsif($IMF eq ">e"){
   	 @SAN=Tok(Mid($CODE));
   	 $SAN[0]=San($SAN[0]);
   	 $SAN[1]=San($SAN[1]);
	  if($SAN[0] >= $SAN[1]){
	  	return 1;
	  	}else{
	  	return 2;
	  	}
   }
    elsif($IMF eq "p"){
   	 @SAN=Tok(Mid($CODE));
   	 $SAN[0]=San($SAN[0]);
   	 $SAN[1]=San($SAN[1]);
	 if($SAN[0] > $SAN[1]){return -1;}elsif($SAN[0] == $SAN[1]){return 0;}else{return 1;}
   }
   elsif($IMF eq "x"){
   @SAN=Tok(Mid($CODE));
   $SAN[0]=San($SAN[0]);
   $SAN[1]=San($SAN[1]);
   return $SAN[0]x$SAN[1];}
   else{return $CODE;}
}
