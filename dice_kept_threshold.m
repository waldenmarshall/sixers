function [score] = dice_kept_threshold(threshold_1,threshold_2)
%UNTITLED2 returns final score from a game of dice where the user keeps
%a certain number of dice on each turn specified by that threshold. Of
%course, the dice the player chooses to keep are the minimums
diceleft=6;
score=0;

if(threshold_1+threshold_2>diceleft)
    threshold_2=diceleft-threshold_1;
end

% roll 1
roll1=randi(6,1,diceleft);
roll1(roll1==3)=0;
roll1=sort(roll1);

% choose which dice to keep after roll 1
dicekept=0;
for i=1:threshold_1
    score=score+roll1(i);
    dicekept=dicekept+1;
end
if (dicekept==0)
    score=score+min(roll1);
    dicekept=dicekept+1;
end
diceleft=diceleft-dicekept;
if(diceleft==0)
    return
end

% roll 2
roll2=randi(6,1,diceleft);
roll2(roll2==3)=0;
roll2=sort(roll2);

% choose which dice to keep after roll 2
dicekept=0;
for i=1:threshold_2
    score=score+roll2(i);
    dicekept=dicekept+1;
end
if (dicekept==0)
    score=score+min(roll2);
    dicekept=dicekept+1;
end
diceleft=diceleft-dicekept;
if(diceleft==0)
    return
end

%roll 3
roll3=randi(6,1,diceleft);
roll3(roll1==3)=0;
score=score+sum(roll3);

end

